"use client";

import { useState } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Textarea } from "@/components/ui/textarea";
import { Badge } from "@/components/ui/badge";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Plus, Check, X } from "lucide-react";
import { format } from "date-fns";
import { toast } from "sonner";
import { hasPermission, getUserPermissions } from "@/lib/permissions";
import { getCurrentUser, hasRole } from "@/lib/auth";

export default function LeavePage() {
  const [isDialogOpen, setIsDialogOpen] = useState(false);
  const user = getCurrentUser();
  const employeeId = user?.id || null;

  // Fetch user permissions
  const { data: permissions } = useQuery({
    queryKey: ["user-permissions"],
    queryFn: getUserPermissions,
  });

  // Check if user can approve/reject (Admin/HR/Manager/Department Lead)
  const canApprove = permissions && hasPermission(permissions, "leave", "approve");

  const { data, isLoading } = useQuery({
    queryKey: ["leave-requests"],
    queryFn: async () => {
      const response = await api.get("/leave");
      return response.data.data;
    },
  });

  const { data: ptoBalance } = useQuery({
    queryKey: ["pto-balance", employeeId],
    queryFn: async () => {
      const response = await api.get(`/pto/balance/${employeeId}`);
      return response.data.data;
    },
    enabled: !!employeeId,
  });

  const leaveRequests = data || [];

  const getStatusBadge = (status: string) => {
    switch (status) {
      case "approved":
        return <Badge className="bg-green-500">Approved</Badge>;
      case "rejected":
        return <Badge className="bg-red-500">Rejected</Badge>;
      case "pending":
        return <Badge className="bg-yellow-500">Pending</Badge>;
      default:
        return <Badge variant="outline">{status}</Badge>;
    }
  };

  return (
    <div className="container mx-auto p-6">
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold">Leave Management</h1>
        <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
          <DialogTrigger asChild>
            <Button>
              <Plus className="mr-2 h-4 w-4" />
              Request Leave
            </Button>
          </DialogTrigger>
          <DialogContent>
            <DialogHeader>
              <DialogTitle>Request Leave</DialogTitle>
            </DialogHeader>
            <LeaveRequestForm onSuccess={() => setIsDialogOpen(false)} />
          </DialogContent>
        </Dialog>
      </div>

      {/* PTO Balance Card */}
      {ptoBalance && (
        <Card className="mb-6 border-primary">
          <CardHeader>
            <CardTitle>PTO Balance</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
              <div>
                <div className="text-sm text-muted-foreground mb-1">Total Balance</div>
                <div className="text-2xl font-bold">{parseFloat(ptoBalance.totalPtoBalance || 0).toFixed(1)} hrs</div>
              </div>
              <div>
                <div className="text-sm text-muted-foreground mb-1">Rollover</div>
                <div className="text-2xl font-bold text-blue-600">{parseFloat(ptoBalance.rolloverHours || 0).toFixed(1)} hrs</div>
              </div>
              <div>
                <div className="text-sm text-muted-foreground mb-1">Pending</div>
                <div className="text-2xl font-bold text-yellow-600">{parseFloat(ptoBalance.pendingHours || 0).toFixed(1)} hrs</div>
              </div>
              <div>
                <div className="text-sm text-muted-foreground mb-1">Used</div>
                <div className="text-2xl font-bold text-red-600">{parseFloat(ptoBalance.usedHours || 0).toFixed(1)} hrs</div>
              </div>
              <div>
                <div className="text-sm text-muted-foreground mb-1">Remaining</div>
                <div className="text-2xl font-bold text-green-600">{parseFloat(ptoBalance.remainingBalance || 0).toFixed(1)} hrs</div>
              </div>
            </div>
            <div className="mt-4 text-sm text-muted-foreground">
              Year: {ptoBalance.year} | 1 day = 8 hours
            </div>
          </CardContent>
        </Card>
      )}

      <Card>
        <CardHeader>
          <CardTitle>Leave Requests</CardTitle>
        </CardHeader>
        <CardContent>
          {isLoading ? (
            <div className="text-center py-8">Loading...</div>
          ) : leaveRequests.length === 0 ? (
            <div className="text-center py-8 text-muted-foreground">No leave requests found</div>
          ) : (
            <Table>
              <TableHeader>
                <TableRow>
                  {canApprove && <TableHead>Employee</TableHead>}
                  <TableHead>Type</TableHead>
                  <TableHead>Start Date</TableHead>
                  <TableHead>End Date</TableHead>
                  <TableHead>Days</TableHead>
                  <TableHead>Status</TableHead>
                  {canApprove && <TableHead>Actions</TableHead>}
                </TableRow>
              </TableHeader>
              <TableBody>
                {leaveRequests.map((request: any) => (
                  <TableRow key={request.id}>
                    {canApprove && (
                      <TableCell>
                        {request.firstName} {request.lastName} ({request.employeeId})
                      </TableCell>
                    )}
                    <TableCell>{request.type}</TableCell>
                    <TableCell>{format(new Date(request.startDate), "MMM d, yyyy")}</TableCell>
                    <TableCell>{format(new Date(request.endDate), "MMM d, yyyy")}</TableCell>
                    <TableCell>{request.daysRequested || "N/A"}</TableCell>
                    <TableCell>{getStatusBadge(request.status)}</TableCell>
                    {canApprove && (
                      <TableCell>
                        {request.status === "pending" && (
                          <div className="flex gap-2">
                            <ApproveLeaveButton requestId={request.id} permissions={permissions} />
                            <RejectLeaveButton requestId={request.id} permissions={permissions} />
                          </div>
                        )}
                      </TableCell>
                    )}
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          )}
        </CardContent>
      </Card>
    </div>
  );
}

function LeaveRequestForm({ onSuccess }: { onSuccess: () => void }) {
  const currentUser = getCurrentUser();
  const [formData, setFormData] = useState({
    type: "PTO",
    startDate: format(new Date(), "yyyy-MM-dd"),
    endDate: format(new Date(), "yyyy-MM-dd"),
    reason: "",
    employeeId: currentUser?.id || "",
  });

  const queryClient = useQueryClient();

  // Fetch permissions to determine if user can request for others (HR/Admin typically have leave:approve)
  const { data: permissions } = useQuery({
    queryKey: ["user-permissions"],
    queryFn: getUserPermissions,
  });

  const isDepartmentLead = hasRole(currentUser, "Department Lead");
  const canRequestForOthers = (!!permissions && hasPermission(permissions, "leave", "approve")) || isDepartmentLead;

  // If can request for others, fetch employees list for selection
  const { data: employeesData } = useQuery({
    queryKey: ["employees"],
    queryFn: async () => {
      const res = await api.get("/employees");
      return res.data.data as any[];
    },
    enabled: !!canRequestForOthers,
  });

  const createMutation = useMutation({
    mutationFn: async (data: any) => {
      const response = await api.post("/leave", data);
      return response.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["leave-requests"] });
      if (formData.employeeId) {
        // Refresh PTO balance to reflect pending hours increment
        queryClient.invalidateQueries({ queryKey: ["pto-balance", formData.employeeId] });
      }
      toast.success("Leave request submitted successfully");
      onSuccess();
    },
    onError: () => {
      toast.error("Failed to submit leave request");
    },
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    createMutation.mutate(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      {canRequestForOthers && (
        <div>
          <Label htmlFor="employeeId">Employee</Label>
          <Select
            value={formData.employeeId}
            onValueChange={(value) => setFormData({ ...formData, employeeId: value })}
          >
            <SelectTrigger>
              <SelectValue placeholder="Select employee" />
            </SelectTrigger>
            <SelectContent>
              {(employeesData || []).map((emp: any) => (
                <SelectItem key={emp.id} value={emp.id}>
                  {emp.firstName} {emp.lastName} ({emp.employeeId})
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>
      )}
      <div>
        <Label htmlFor="type">Leave Type</Label>
        <Select
          value={formData.type}
          onValueChange={(value) => setFormData({ ...formData, type: value })}
        >
          <SelectTrigger>
            <SelectValue />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="PTO">PTO</SelectItem>
            <SelectItem value="Sick Leave">Sick Leave</SelectItem>
            <SelectItem value="Unpaid Leave">Unpaid Leave</SelectItem>
          </SelectContent>
        </Select>
      </div>

      <div className="grid grid-cols-2 gap-4">
        <div>
          <Label htmlFor="startDate">Start Date</Label>
          <Input
            id="startDate"
            type="date"
            value={formData.startDate}
            onChange={(e) => setFormData({ ...formData, startDate: e.target.value })}
            required
          />
        </div>
        <div>
          <Label htmlFor="endDate">End Date</Label>
          <Input
            id="endDate"
            type="date"
            value={formData.endDate}
            onChange={(e) => setFormData({ ...formData, endDate: e.target.value })}
            required
          />
        </div>
      </div>

      <div>
        <Label htmlFor="reason">Reason</Label>
        <Textarea
          id="reason"
          value={formData.reason}
          onChange={(e) => setFormData({ ...formData, reason: e.target.value })}
          rows={3}
        />
      </div>

      <div className="flex justify-end gap-2">
        <Button type="button" variant="outline" onClick={onSuccess}>
          Cancel
        </Button>
        <Button type="submit" disabled={createMutation.isPending}>
          {createMutation.isPending ? "Submitting..." : "Submit Request"}
        </Button>
      </div>
    </form>
  );
}

function ApproveLeaveButton({ requestId, permissions }: { requestId: string; permissions?: any }) {
  const queryClient = useQueryClient();
  const currentUser = getCurrentUser();

  const approveMutation = useMutation({
    mutationFn: async () => {
      const response = await api.put(`/leave/${requestId}/approve`, {
        approvedBy: currentUser?.id,
      });
      return response.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["leave-requests"] });
      toast.success("Leave request approved");
    },
  });

  const canApprove = permissions && hasPermission(permissions, "leave", "approve");

  if (!canApprove) {
    return null;
  }

  return (
    <Button
      size="sm"
      variant="outline"
      className="text-green-600"
      onClick={() => approveMutation.mutate()}
      disabled={approveMutation.isPending}
    >
      <Check className="h-4 w-4" />
    </Button>
  );
}

function RejectLeaveButton({ requestId, permissions }: { requestId: string; permissions?: any }) {
  const queryClient = useQueryClient();
  const currentUser = getCurrentUser();

  const rejectMutation = useMutation({
    mutationFn: async () => {
      const response = await api.put(`/leave/${requestId}/reject`, {
        approvedBy: currentUser?.id,
        rejectionReason: "Not approved",
      });
      return response.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["leave-requests"] });
      toast.success("Leave request rejected");
    },
  });

  const canReject = permissions && hasPermission(permissions, "leave", "reject");

  if (!canReject) {
    return null;
  }

  return (
    <Button
      size="sm"
      variant="outline"
      className="text-red-600"
      onClick={() => rejectMutation.mutate()}
      disabled={rejectMutation.isPending}
    >
      <X className="h-4 w-4" />
    </Button>
  );
}
