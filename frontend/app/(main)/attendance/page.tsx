"use client";

import { useState, useEffect } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Badge } from "@/components/ui/badge";
import { Alert, AlertDescription, AlertTitle } from "@/components/ui/alert";
import { Clock, AlertCircle, CheckCircle2, Flag } from "lucide-react";
import { format } from "date-fns";
import { toast } from "sonner";
import { getCurrentUser, hasAnyRole } from "@/lib/auth";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog";
import { Textarea } from "@/components/ui/textarea";
import { getUserPermissions, hasPermission } from "@/lib/permissions";

export default function AttendancePage() {
  const [employeeId, setEmployeeId] = useState<string | null>(null);
  const [canViewDepartment, setCanViewDepartment] = useState(false);
  const [deptId, setDeptId] = useState<string>("");
  const [startDate, setStartDate] = useState(format(new Date(Date.now() - 6 * 24 * 60 * 60 * 1000), "yyyy-MM-dd"));
  const [endDate, setEndDate] = useState(format(new Date(), "yyyy-MM-dd"));
  const [isAddDialogOpen, setIsAddDialogOpen] = useState(false);

  // Get current employee ID from logged-in user
  useEffect(() => {
    const user = getCurrentUser();
    if (user) {
      setEmployeeId(user.id);
      setCanViewDepartment(
        hasAnyRole(user, ["HR", "Department Lead", "Admin"])
      );
      // default department to user's department for convenience
      if (user.departmentId) setDeptId(user.departmentId);
    }
  }, []);

  const { data: currentStatus, refetch: refetchStatus } = useQuery({
    queryKey: ["attendance-current-status", employeeId],
    queryFn: async () => {
      if (!employeeId) return null;
      const response = await api.get(`/attendance/current-status/${employeeId}`);
      return response.data.data;
    },
    enabled: !!employeeId,
    refetchInterval: 30000, // Refetch every 30 seconds
  });

  const { data: attendanceLogs, isLoading } = useQuery({
    queryKey: ["attendance-logs", employeeId],
    queryFn: async () => {
      if (!employeeId) return [];
      const response = await api.get(`/attendance/logs?employeeId=${employeeId}&startDate=${format(new Date(Date.now() - 7 * 24 * 60 * 60 * 1000), "yyyy-MM-dd")}`);
      return response.data.data;
    },
    enabled: !!employeeId,
  });

  const queryClient = useQueryClient();

  // Permissions
  const { data: permissions } = useQuery({
    queryKey: ["user-permissions"],
    queryFn: getUserPermissions,
  });
  const canUpdate = permissions && hasPermission(permissions, "attendance", "update");

  // Employees (scoped by backend to department for leads)
  const { data: employees } = useQuery({
    queryKey: ["employees"],
    queryFn: async () => {
      const res = await api.get(`/employees`);
      return res.data.data || [];
    },
    enabled: !!canViewDepartment,
  });

  const clockInMutation = useMutation({
    mutationFn: async () => {
      // Backend will use current logged-in user's ID automatically
      const response = await api.post("/attendance/clock-in", {});
      return response.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["attendance-current-status", employeeId] });
      queryClient.invalidateQueries({ queryKey: ["attendance-logs", employeeId] });
      toast.success("Clocked in successfully");
      refetchStatus();
    },
    onError: (error: any) => {
      toast.error(error.response?.data?.error || "Failed to clock in. Please ensure you're using a designated device.");
    },
  });

  const clockOutMutation = useMutation({
    mutationFn: async () => {
      // Backend will use current logged-in user's ID automatically
      const response = await api.post("/attendance/clock-out", {});
      return response.data;
    },
    onSuccess: (data) => {
      queryClient.invalidateQueries({ queryKey: ["attendance-current-status", employeeId] });
      queryClient.invalidateQueries({ queryKey: ["attendance-logs", employeeId] });
      toast.success(`Clocked out successfully. Total hours: ${data.data.totalHours}`);
      refetchStatus();
    },
    onError: (error: any) => {
      toast.error(error.response?.data?.error || "Failed to clock out");
    },
  });

  // Manual add missing clock-in
  const manualAddMutation = useMutation({
    mutationFn: async (payload: any) => {
      const res = await api.post(`/attendance/manual`, payload);
      return res.data;
    },
    onSuccess: () => {
      toast.success("Attendance entry added");
      queryClient.invalidateQueries({ queryKey: ["attendance-logs", employeeId] });
      setIsAddDialogOpen(false);
    },
    onError: (error: any) => {
      toast.error(error.response?.data?.error || "Failed to add attendance entry");
    },
  });

  // Flag log for HR
  const flagLogMutation = useMutation({
    mutationFn: async ({ logId, reason }: { logId: string; reason: string }) => {
      const res = await api.post(`/attendance/flag`, { logId, reason });
      return res.data;
    },
    onSuccess: () => {
      toast.success("Flagged for HR review");
    },
    onError: (error: any) => {
      toast.error(error.response?.data?.error || "Failed to flag entry");
    },
  });

  const isClockedIn = currentStatus?.isClockedIn || false;
  const currentLog = currentStatus?.attendanceLog;

  // Calculate hours worked today
  const todayLogs = attendanceLogs?.filter((log: any) => {
    const logDate = format(new Date(log.clockIn), "yyyy-MM-dd");
    const today = format(new Date(), "yyyy-MM-dd");
    return logDate === today && log.clockOut;
  }) || [];

  const totalHoursToday = todayLogs.reduce((sum: number, log: any) => {
    return sum + (parseFloat(log.totalHours) || 0);
  }, 0);

  // Department list for filters (only for HR/Admin/Leads)
  const { data: departments } = useQuery({
    queryKey: ["departments"],
    queryFn: async () => {
      const response = await api.get("/departments");
      return response.data.data;
    },
    enabled: canViewDepartment,
  });

  // Manager/Lead department group data
  const { data: managerData } = useQuery({
    queryKey: ["attendance-manager-review", deptId, startDate, endDate],
    queryFn: async () => {
      const params = new URLSearchParams();
      if (deptId && deptId !== "all") params.append("departmentId", deptId);
      if (startDate) params.append("startDate", startDate);
      if (endDate) params.append("endDate", endDate);
      const res = await api.get(`/attendance/manager-review?${params.toString()}`);
      return res.data.data;
    },
    enabled: canViewDepartment,
  });

  return (
    <div className="container mx-auto p-6">
      <div className="mb-6">
        <div className="flex flex-col gap-3 lg:flex-row lg:items-end lg:justify-between">
          <div>
            <h1 className="text-3xl font-bold mb-2">Attendance & Clock-In</h1>
            <p className="text-muted-foreground">Clock in and out, view your attendance history</p>
          </div>
          <div className="flex items-center gap-3">
            {canViewDepartment && (
              <div className="min-w-[260px]">
                <Label className="mb-1 block">View logs for</Label>
                <Select value={employeeId || ""} onValueChange={(v) => setEmployeeId(v)}>
                  <SelectTrigger>
                    <SelectValue placeholder="Select employee" />
                  </SelectTrigger>
                  <SelectContent>
                    {employees?.map((emp: any) => (
                      <SelectItem key={emp.id} value={emp.id}>
                        {emp.firstName} {emp.lastName} ({emp.employeeId})
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>
            )}
            {canViewDepartment && canUpdate && (
              <Dialog open={isAddDialogOpen} onOpenChange={setIsAddDialogOpen}>
                <DialogTrigger asChild>
                  <Button>Add Missing Clock-In</Button>
                </DialogTrigger>
                <DialogContent className="max-w-lg">
                  <DialogHeader>
                    <DialogTitle>Add Missing Clock-In</DialogTitle>
                  </DialogHeader>
                  <AddMissingForm
                    employees={employees || []}
                    defaultEmployeeId={employeeId || ""}
                    onSubmit={(payload) => manualAddMutation.mutate(payload)}
                    submitting={manualAddMutation.isPending}
                  />
                </DialogContent>
              </Dialog>
            )}
          </div>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-6">
        {/* Clock-In/Out Card */}
        <Card className="lg:col-span-2">
          <CardHeader>
            <CardTitle>Clock In / Clock Out</CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            {isClockedIn && currentLog ? (
              <div className="space-y-4">
                <Alert>
                  <CheckCircle2 className="h-4 w-4" />
                  <AlertTitle>Currently Clocked In</AlertTitle>
                  <AlertDescription>
                    You clocked in at {format(new Date(currentLog.clockIn), "MMM d, yyyy 'at' h:mm a")}
                    {currentLog.isLate && (
                      <Badge variant="destructive" className="ml-2">Late</Badge>
                    )}
                  </AlertDescription>
                </Alert>
                
                <div className="bg-muted p-4 rounded-lg">
                  <div className="flex justify-between items-center mb-2">
                    <span className="text-sm text-muted-foreground">Clock In Time:</span>
                    <span className="font-medium">{format(new Date(currentLog.clockIn), "h:mm a")}</span>
                  </div>
                  <div className="flex justify-between items-center mb-2">
                    <span className="text-sm text-muted-foreground">Duration:</span>
                    <span className="font-medium">
                      {Math.floor((Date.now() - new Date(currentLog.clockIn).getTime()) / (1000 * 60))} minutes
                    </span>
                  </div>
                </div>

                <Button
                  onClick={() => clockOutMutation.mutate()}
                  disabled={clockOutMutation.isPending}
                  className="w-full"
                  size="lg"
                  variant="destructive"
                >
                  <Clock className="mr-2 h-5 w-5" />
                  {clockOutMutation.isPending ? "Clocking Out..." : "Clock Out"}
                </Button>
              </div>
            ) : (
              <div className="space-y-4">
                <Alert>
                  <AlertCircle className="h-4 w-4" />
                  <AlertTitle>Not Clocked In</AlertTitle>
                  <AlertDescription>
                    Click the button below to clock in. You can clock in from your portal or from designated physical devices.
                  </AlertDescription>
                </Alert>

                <Button
                  onClick={() => clockInMutation.mutate()}
                  disabled={clockInMutation.isPending}
                  className="w-full"
                  size="lg"
                >
                  <Clock className="mr-2 h-5 w-5" />
                  {clockInMutation.isPending ? "Clocking In..." : "Clock In"}
                </Button>
              </div>
            )}
          </CardContent>
        </Card>

        {/* Today's Summary */}
        <Card>
          <CardHeader>
            <CardTitle>Today's Summary</CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div>
              <div className="text-sm text-muted-foreground mb-1">Total Hours Today</div>
              <div className="text-3xl font-bold">{totalHoursToday.toFixed(2)}</div>
            </div>
            <div>
              <div className="text-sm text-muted-foreground mb-1">Clock-Ins Today</div>
              <div className="text-2xl font-semibold">{todayLogs.length}</div>
            </div>
            {isClockedIn && (
              <div className="pt-4 border-t">
                <div className="text-sm text-muted-foreground mb-1">Current Session</div>
                <div className="text-lg font-semibold text-primary">Active</div>
              </div>
            )}
          </CardContent>
        </Card>
      </div>

      {/* Attendance History */}
      <Card>
        <CardHeader>
          <CardTitle>Recent Attendance History</CardTitle>
        </CardHeader>
        <CardContent>
          {isLoading ? (
            <div className="text-center py-8">Loading attendance history...</div>
          ) : attendanceLogs && attendanceLogs.length > 0 ? (
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Date</TableHead>
                  <TableHead>Clock In</TableHead>
                  <TableHead>Clock Out</TableHead>
                  <TableHead>Total Hours</TableHead>
                  <TableHead>Status</TableHead>
                  {canViewDepartment && canUpdate && <TableHead>Actions</TableHead>}
                </TableRow>
              </TableHeader>
              <TableBody>
                {attendanceLogs.map((log: any) => (
                  <TableRow key={log.id}>
                    <TableCell>{format(new Date(log.clockIn), "MMM d, yyyy")}</TableCell>
                    <TableCell>{format(new Date(log.clockIn), "h:mm a")}</TableCell>
                    <TableCell>
                      {log.clockOut ? format(new Date(log.clockOut), "h:mm a") : (
                        <Badge variant="outline">Active</Badge>
                      )}
                    </TableCell>
                    <TableCell>
                      {log.totalHours ? `${parseFloat(log.totalHours).toFixed(2)} hrs` : "-"}
                    </TableCell>
                    <TableCell>
                      {log.isLate && <Badge variant="destructive" className="mr-1">Late</Badge>}
                      {log.isNoShow && <Badge variant="destructive">No Show</Badge>}
                      {!log.isLate && !log.isNoShow && log.clockOut && (
                        <Badge variant="default">On Time</Badge>
                      )}
                    </TableCell>
                    {canViewDepartment && canUpdate && (
                      <TableCell>
                        <Button
                          variant="outline"
                          size="sm"
                          onClick={() => {
                            const reason = window.prompt("Reason for flagging?") || "";
                            if (reason !== null) {
                              flagLogMutation.mutate({ logId: log.id, reason });
                            }
                          }}
                          disabled={flagLogMutation.isPending}
                          title="Flag this entry for HR review"
                        >
                          <Flag className="h-4 w-4 mr-1" /> Flag
                        </Button>
                      </TableCell>
                    )}
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          ) : (
            <div className="text-center py-8 text-muted-foreground">
              No attendance records found
            </div>
          )}
        </CardContent>
      </Card>

      {canViewDepartment && (
        <Card className="mt-6">
          <CardHeader>
            <CardTitle>Department Group View</CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              <div>
                <Label htmlFor="department">Department</Label>
                <Select value={deptId} onValueChange={setDeptId}>
                  <SelectTrigger>
                    <SelectValue placeholder="All Departments" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Departments</SelectItem>
                    {departments?.map((dept: any) => (
                      <SelectItem key={dept.id} value={dept.id}>
                        {dept.name}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>
              <div>
                <Label htmlFor="startDate">Start Date</Label>
                <Input id="startDate" type="date" value={startDate} onChange={(e) => setStartDate(e.target.value)} />
              </div>
              <div>
                <Label htmlFor="endDate">End Date</Label>
                <Input id="endDate" type="date" value={endDate} onChange={(e) => setEndDate(e.target.value)} />
              </div>
            </div>

            <div className="bg-card border rounded-lg overflow-hidden">
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>Employee</TableHead>
                    <TableHead>Emp ID</TableHead>
                    <TableHead>Department</TableHead>
                    <TableHead className="text-right">Attendance Count</TableHead>
                    <TableHead className="text-right">Total Hours</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {managerData?.totalHours?.map((row: any) => (
                    <TableRow key={row.employeeId}>
                      <TableCell>{row.firstName} {row.lastName}</TableCell>
                      <TableCell>{row.empId}</TableCell>
                      <TableCell>{row.departmentName || "-"}</TableCell>
                      <TableCell className="text-right">{row.attendanceCount}</TableCell>
                      <TableCell className="text-right">{Number(row.totalHours || 0).toFixed(2)}</TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
              {(!managerData || managerData.totalHours?.length === 0) && (
                <div className="p-6 text-center text-muted-foreground">No data for selected period</div>
              )}
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  );
}

function AddMissingForm({
  employees,
  defaultEmployeeId,
  onSubmit,
  submitting,
}: {
  employees: any[];
  defaultEmployeeId: string;
  onSubmit: (payload: any) => void;
  submitting: boolean;
}) {
  const [form, setForm] = useState({
    employeeId: defaultEmployeeId,
    date: format(new Date(), "yyyy-MM-dd"),
    clockIn: "09:00",
    clockOut: "",
    notes: "",
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    const payload: any = {
      employeeId: form.employeeId,
      clockIn: `${form.date} ${form.clockIn}:00`,
      notes: form.notes || undefined,
    };
    if (form.clockOut) {
      payload.clockOut = `${form.date} ${form.clockOut}:00`;
    }
    onSubmit(payload);
  };

  return (
    <form className="space-y-4" onSubmit={handleSubmit}>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <Label>Employee</Label>
          <Select
            value={form.employeeId}
            onValueChange={(v) => setForm((f) => ({ ...f, employeeId: v }))}
          >
            <SelectTrigger>
              <SelectValue placeholder="Select employee" />
            </SelectTrigger>
            <SelectContent>
              {employees?.map((emp: any) => (
                <SelectItem key={emp.id} value={emp.id}>
                  {emp.firstName} {emp.lastName} ({emp.employeeId})
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>
        <div>
          <Label>Date</Label>
          <Input
            type="date"
            value={form.date}
            onChange={(e) => setForm((f) => ({ ...f, date: e.target.value }))}
            required
          />
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <Label>Clock-In Time</Label>
          <Input
            type="time"
            value={form.clockIn}
            onChange={(e) => setForm((f) => ({ ...f, clockIn: e.target.value }))}
            required
          />
        </div>
        <div>
          <Label>Clock-Out Time (optional)</Label>
          <Input
            type="time"
            value={form.clockOut}
            onChange={(e) => setForm((f) => ({ ...f, clockOut: e.target.value }))}
          />
        </div>
      </div>

      <div>
        <Label>Notes (optional)</Label>
        <Textarea
          rows={3}
          value={form.notes}
          onChange={(e) => setForm((f) => ({ ...f, notes: e.target.value }))}
          placeholder="Explain why this entry is being added"
        />
      </div>

      <div className="flex justify-end gap-2">
        <Button type="submit" disabled={submitting}>
          {submitting ? "Adding..." : "Add Entry"}
        </Button>
      </div>
    </form>
  );
}

