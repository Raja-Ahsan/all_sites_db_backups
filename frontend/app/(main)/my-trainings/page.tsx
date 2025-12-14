"use client";

import { useState } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import api from "@/lib/api";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Label } from "@/components/ui/label";
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle } from "@/components/ui/dialog";
import { CheckCircle2, AlertCircle, Clock, Play, Download, FileText, Video, FileCheck, BookOpen, Pause } from "lucide-react";
import { format } from "date-fns";
import { getCurrentUser } from "@/lib/auth";
import { toast } from "sonner";

export default function MyTrainingsPage() {
  const [filterType, setFilterType] = useState<string>("all");
  const [filterStatus, setFilterStatus] = useState<string>("all");
  const [selectedTraining, setSelectedTraining] = useState<any>(null);
  const [isDetailDialogOpen, setIsDetailDialogOpen] = useState(false);
  
  const user = getCurrentUser();
  const employeeId = user?.id;
  const queryClient = useQueryClient();

  const { data, isLoading, error } = useQuery({
    queryKey: ["my-trainings", employeeId, filterType, filterStatus],
    queryFn: async () => {
      if (!employeeId) return [];
      const params = new URLSearchParams();
      if (filterType !== "all") {
        params.append("trainingType", filterType);
      }
      if (filterStatus !== "all") {
        params.append("status", filterStatus);
      }
      const queryString = params.toString();
      const url = `/training/my-trainings${queryString ? `?${queryString}` : ""}`;
      const res = await api.get(url);
      return res.data.data;
    },
    enabled: !!employeeId,
  });

  // Mutation to start/resume training
  const startTrainingMutation = useMutation({
    mutationFn: async (trainingId: string) => {
      const res = await api.put(`/training/records/${trainingId}/start`);
      return res.data;
    },
    onSuccess: (data) => {
      queryClient.invalidateQueries({ queryKey: ["my-trainings"] });
      toast.success(data.message || "Training started successfully");
    },
    onError: (error: any) => {
      toast.error(error.response?.data?.error || "Failed to start training");
    },
  });

  // Mutation to stop/pause training
  const stopTrainingMutation = useMutation({
    mutationFn: async (trainingId: string) => {
      const res = await api.put(`/training/records/${trainingId}/stop`);
      return res.data;
    },
    onSuccess: (data) => {
      queryClient.invalidateQueries({ queryKey: ["my-trainings"] });
      toast.success(data.message || "Training paused successfully");
    },
    onError: (error: any) => {
      toast.error(error.response?.data?.error || "Failed to pause training");
    },
  });

  // Mutation to fetch training details
  const fetchTrainingDetails = async (trainingId: string) => {
    try {
      const res = await api.get(`/training/records/${trainingId}/details`);
      return res.data.data;
    } catch (error: any) {
      toast.error(error.response?.data?.error || "Failed to load training details");
      return null;
    }
  };

  // Function to download certificate
  const handleDownloadCertificate = async (trainingId: string) => {
    try {
      const res = await api.get(`/training/records/${trainingId}/certificate`);
      const { certificateUrl } = res.data.data;
      
      // Open certificate in new tab for download
      window.open(certificateUrl, '_blank');
      toast.success("Certificate download started");
    } catch (error: any) {
      toast.error(error.response?.data?.error || "Failed to download certificate");
    }
  };

  // Function to view training details
  const handleViewDetails = async (training: any) => {
    setSelectedTraining(training);
    const details = await fetchTrainingDetails(training.id);
    if (details) {
      setSelectedTraining(details);
      setIsDetailDialogOpen(true);
    }
  };

  // Function to start/resume training
  const handleStartTraining = (trainingId: string) => {
    startTrainingMutation.mutate(trainingId);
  };

  // Function to stop/pause training
  const handleStopTraining = (trainingId: string) => {
    stopTrainingMutation.mutate(trainingId);
  };

  if (isLoading) {
    return (
      <div className="container mx-auto p-6">
        <h1 className="text-3xl font-bold mb-6">My Trainings</h1>
        <div className="text-center">Loading...</div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="container mx-auto p-6">
        <h1 className="text-3xl font-bold mb-6">My Trainings</h1>
        <div className="text-red-500">Error loading trainings</div>
      </div>
    );
  }

  const trainings = data || [];
  const pendingTrainings = trainings.filter((t: any) => t.status === "pending" || t.status === "overdue");
  const inProgressTrainings = trainings.filter((t: any) => t.status === "in_progress");
  const completedTrainings = trainings.filter((t: any) => t.status === "completed");
  const overdueTrainings = trainings.filter((t: any) => t.status === "overdue");

  const getStatusBadge = (status: string, dueDate?: string) => {
    if (status === "completed") {
      return (
        <Badge className="bg-green-500">
          <CheckCircle2 className="h-3 w-3 mr-1" />
          Completed
        </Badge>
      );
    }
    if (status === "in_progress") {
      return (
        <Badge variant="default" className="bg-blue-500">
          <Play className="h-3 w-3 mr-1" />
          In Progress
        </Badge>
      );
    }
    if (status === "overdue") {
      return (
        <Badge variant="destructive">
          <AlertCircle className="h-3 w-3 mr-1" />
          Overdue
        </Badge>
      );
    }
    if (status === "pending") {
      const isDueSoon = dueDate && new Date(dueDate) <= new Date(Date.now() + 7 * 24 * 60 * 60 * 1000);
      return (
        <Badge variant={isDueSoon ? "default" : "secondary"}>
          <Clock className="h-3 w-3 mr-1" />
          {isDueSoon ? "Due Soon" : "Pending"}
        </Badge>
      );
    }
    return <Badge variant="outline">{status}</Badge>;
  };

  return (
    <div className="container mx-auto p-6">
      <div className="mb-6">
        <h1 className="text-3xl font-bold">My Trainings</h1>
        <p className="text-muted-foreground mt-1">View, start, and track your assigned trainings</p>
      </div>

      {/* Summary Cards */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-muted-foreground">Total Trainings</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{trainings.length}</div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-muted-foreground">Pending</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-yellow-600">{pendingTrainings.length}</div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-muted-foreground">In Progress</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-blue-600">{inProgressTrainings.length}</div>
          </CardContent>
        </Card>
        <Card>
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium text-muted-foreground">Completed</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-green-600">{completedTrainings.length}</div>
          </CardContent>
        </Card>
      </div>

      {/* Filters */}
      <Card className="mb-6">
        <CardContent className="pt-6">
          <div className="flex items-center gap-4 flex-wrap">
            <div className="flex items-center gap-2">
              <Label>Type:</Label>
              <Select value={filterType} onValueChange={setFilterType}>
                <SelectTrigger className="w-[200px]">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Types</SelectItem>
                  <SelectItem value="Sexual Harassment">Sexual Harassment</SelectItem>
                  <SelectItem value="HIPAA">HIPAA</SelectItem>
                  <SelectItem value="Pharmacy Compliance">Pharmacy Compliance</SelectItem>
                  <SelectItem value="Safety">Safety</SelectItem>
                  <SelectItem value="SOP">SOP</SelectItem>
                  <SelectItem value="Other">Other</SelectItem>
                </SelectContent>
              </Select>
            </div>
            <div className="flex items-center gap-2">
              <Label>Status:</Label>
              <Select value={filterStatus} onValueChange={setFilterStatus}>
                <SelectTrigger className="w-[200px]">
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Status</SelectItem>
                  <SelectItem value="pending">Pending</SelectItem>
                  <SelectItem value="in_progress">In Progress</SelectItem>
                  <SelectItem value="overdue">Overdue</SelectItem>
                  <SelectItem value="completed">Completed</SelectItem>
                </SelectContent>
              </Select>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Trainings Table */}
      <Card>
        <CardHeader>
          <CardTitle>My Training Assignments</CardTitle>
        </CardHeader>
        <CardContent>
          {trainings.length === 0 ? (
            <div className="text-center py-8 text-muted-foreground">
              No trainings assigned yet.
            </div>
          ) : (
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Training Title</TableHead>
                  <TableHead>Category</TableHead>
                  <TableHead>Assigned Date</TableHead>
                  <TableHead>Due Date</TableHead>
                  <TableHead>Status</TableHead>
                  <TableHead>Duration</TableHead>
                  <TableHead className="text-right">Actions</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {trainings.map((training: any) => (
                  <TableRow key={training.id}>
                    <TableCell className="font-medium">{training.trainingTitle}</TableCell>
                    <TableCell>{training.category || "N/A"}</TableCell>
                    <TableCell>
                      {training.assignedDate
                        ? format(new Date(training.assignedDate), "MMM d, yyyy")
                        : "N/A"}
                    </TableCell>
                    <TableCell>
                      {training.dueDate
                        ? format(new Date(training.dueDate), "MMM d, yyyy")
                        : "No due date"}
                    </TableCell>
                    <TableCell>
                      {getStatusBadge(training.status, training.dueDate)}
                    </TableCell>
                    <TableCell>
                      {training.duration ? `${training.duration} min` : "N/A"}
                    </TableCell>
                    <TableCell className="text-right">
                      <div className="flex justify-end gap-2">
                        <Button
                          variant="outline"
                          size="sm"
                          onClick={() => handleViewDetails(training)}
                          title="View Details"
                        >
                          <FileText className="h-4 w-4" />
                        </Button>
                        {(training.status === "pending" || training.status === "overdue") && (
                          <Button
                            variant="default"
                            size="sm"
                            onClick={() => handleStartTraining(training.id)}
                            disabled={startTrainingMutation.isPending}
                            title="Start Training"
                          >
                            <Play className="h-4 w-4 mr-1" />
                            Start
                          </Button>
                        )}
                        {training.status === "in_progress" && (
                          <>
                            <Button
                              variant="default"
                              size="sm"
                              onClick={() => handleStartTraining(training.id)}
                              disabled={startTrainingMutation.isPending}
                              title="Resume Training"
                            >
                              <Play className="h-4 w-4 mr-1" />
                              Resume
                            </Button>
                            <Button
                              variant="outline"
                              size="sm"
                              onClick={() => handleStopTraining(training.id)}
                              disabled={stopTrainingMutation.isPending}
                              title="Pause Training"
                            >
                              <Pause className="h-4 w-4 mr-1" />
                              Pause
                            </Button>
                          </>
                        )}
                        {training.status === "completed" && training.certificateUrl && (
                          <Button
                            variant="outline"
                            size="sm"
                            onClick={() => handleDownloadCertificate(training.id)}
                            title="Download Certificate"
                          >
                            <Download className="h-4 w-4" />
                          </Button>
                        )}
                      </div>
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          )}
        </CardContent>
      </Card>

      {/* Priority Section - Overdue and Due Soon */}
      {(overdueTrainings.length > 0 || pendingTrainings.some((t: any) => {
        if (!t.dueDate) return false;
        const dueDate = new Date(t.dueDate);
        const now = new Date();
        const daysUntilDue = Math.ceil((dueDate.getTime() - now.getTime()) / (1000 * 60 * 60 * 24));
        return daysUntilDue <= 7 && daysUntilDue >= 0;
      })) && (
        <Card className="mt-6 border-orange-500">
          <CardHeader>
            <CardTitle className="text-orange-600">⚠️ Action Required</CardTitle>
          </CardHeader>
          <CardContent>
            {overdueTrainings.length > 0 && (
              <div className="mb-4">
                <h3 className="font-semibold text-red-600 mb-2">Overdue Trainings ({overdueTrainings.length})</h3>
                <ul className="list-disc list-inside space-y-1">
                  {overdueTrainings.map((training: any) => (
                    <li key={training.id} className="text-sm">
                      {training.trainingTitle} - Due: {training.dueDate ? format(new Date(training.dueDate), "MMM d, yyyy") : "N/A"}
                    </li>
                  ))}
                </ul>
              </div>
            )}
            {pendingTrainings.filter((t: any) => {
              if (!t.dueDate) return false;
              const dueDate = new Date(t.dueDate);
              const now = new Date();
              const daysUntilDue = Math.ceil((dueDate.getTime() - now.getTime()) / (1000 * 60 * 60 * 24));
              return daysUntilDue <= 7 && daysUntilDue >= 0;
            }).length > 0 && (
              <div>
                <h3 className="font-semibold text-yellow-600 mb-2">Due Soon (Next 7 Days)</h3>
                <ul className="list-disc list-inside space-y-1">
                  {pendingTrainings
                    .filter((t: any) => {
                      if (!t.dueDate) return false;
                      const dueDate = new Date(t.dueDate);
                      const now = new Date();
                      const daysUntilDue = Math.ceil((dueDate.getTime() - now.getTime()) / (1000 * 60 * 60 * 24));
                      return daysUntilDue <= 7 && daysUntilDue >= 0;
                    })
                    .map((training: any) => (
                      <li key={training.id} className="text-sm">
                        {training.trainingTitle} - Due: {format(new Date(training.dueDate), "MMM d, yyyy")}
                      </li>
                    ))}
                </ul>
              </div>
            )}
          </CardContent>
        </Card>
      )}

      {/* Training Details Dialog */}
      <Dialog open={isDetailDialogOpen} onOpenChange={setIsDetailDialogOpen}>
        <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
          <DialogHeader>
            <DialogTitle>{selectedTraining?.trainingTitle || "Training Details"}</DialogTitle>
            <DialogDescription>
              View training information and completion requirements
            </DialogDescription>
          </DialogHeader>
          {selectedTraining && (
            <div className="space-y-4">
              {/* Training Information */}
              <div>
                <h3 className="font-semibold mb-2">Training Information</h3>
                <div className="space-y-2 text-sm">
                  <div className="flex justify-between">
                    <span className="text-muted-foreground">Category:</span>
                    <span>{selectedTraining.category || "N/A"}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-muted-foreground">Duration:</span>
                    <span>{selectedTraining.duration ? `${selectedTraining.duration} minutes` : "N/A"}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-muted-foreground">Status:</span>
                    <span>{getStatusBadge(selectedTraining.status, selectedTraining.dueDate)}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-muted-foreground">Assigned Date:</span>
                    <span>
                      {selectedTraining.assignedDate
                        ? format(new Date(selectedTraining.assignedDate), "MMM d, yyyy")
                        : "N/A"}
                    </span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-muted-foreground">Due Date:</span>
                    <span>
                      {selectedTraining.dueDate
                        ? format(new Date(selectedTraining.dueDate), "MMM d, yyyy")
                        : "No due date"}
                    </span>
                  </div>
                  {selectedTraining.completedDate && (
                    <div className="flex justify-between">
                      <span className="text-muted-foreground">Completed Date:</span>
                      <span>{format(new Date(selectedTraining.completedDate), "MMM d, yyyy")}</span>
                    </div>
                  )}
                  {selectedTraining.score !== null && selectedTraining.score !== undefined && (
                    <div className="flex justify-between">
                      <span className="text-muted-foreground">Score:</span>
                      <span>{selectedTraining.score}%</span>
                    </div>
                  )}
                </div>
              </div>

              {/* Description */}
              {selectedTraining.trainingDescription && (
                <div>
                  <h3 className="font-semibold mb-2">Description</h3>
                  <p className="text-sm text-muted-foreground">{selectedTraining.trainingDescription}</p>
                </div>
              )}

              {/* Completion Requirements */}
              <div>
                <h3 className="font-semibold mb-2">Completion Requirements</h3>
                <div className="space-y-2">
                  {selectedTraining.supportsVideo && (
                    <div className="flex items-center gap-2 text-sm">
                      <Video className="h-4 w-4 text-blue-500" />
                      <span>Watch training video</span>
                    </div>
                  )}
                  {selectedTraining.supportsPDF && (
                    <div className="flex items-center gap-2 text-sm">
                      <FileText className="h-4 w-4 text-red-500" />
                      <span>Review training materials (PDF)</span>
                    </div>
                  )}
                  {selectedTraining.supportsQuiz && (
                    <div className="flex items-center gap-2 text-sm">
                      <FileCheck className="h-4 w-4 text-green-500" />
                      <span>Complete quiz assessment</span>
                    </div>
                  )}
                  {!selectedTraining.supportsVideo && !selectedTraining.supportsPDF && !selectedTraining.supportsQuiz && (
                    <div className="flex items-center gap-2 text-sm text-muted-foreground">
                      <BookOpen className="h-4 w-4" />
                      <span>Follow training instructions as provided</span>
                    </div>
                  )}
                </div>
              </div>

              {/* Actions */}
              <div className="flex gap-2 pt-4 border-t">
                {(selectedTraining.status === "pending" || selectedTraining.status === "overdue") && (
                  <Button
                    onClick={() => {
                      handleStartTraining(selectedTraining.id);
                      setIsDetailDialogOpen(false);
                    }}
                    disabled={startTrainingMutation.isPending}
                  >
                    <Play className="h-4 w-4 mr-2" />
                    Start Training
                  </Button>
                )}
                {selectedTraining.status === "in_progress" && (
                  <>
                    <Button
                      onClick={() => {
                        handleStartTraining(selectedTraining.id);
                        setIsDetailDialogOpen(false);
                      }}
                      disabled={startTrainingMutation.isPending}
                    >
                      <Play className="h-4 w-4 mr-2" />
                      Resume Training
                    </Button>
                    <Button
                      variant="outline"
                      onClick={() => {
                        handleStopTraining(selectedTraining.id);
                        setIsDetailDialogOpen(false);
                      }}
                      disabled={stopTrainingMutation.isPending}
                    >
                      <Pause className="h-4 w-4 mr-2" />
                      Pause Training
                    </Button>
                  </>
                )}
                {selectedTraining.status === "completed" && selectedTraining.certificateUrl && (
                  <Button
                    variant="outline"
                    onClick={() => {
                      handleDownloadCertificate(selectedTraining.id);
                      setIsDetailDialogOpen(false);
                    }}
                  >
                    <Download className="h-4 w-4 mr-2" />
                    Download Certificate
                  </Button>
                )}
              </div>
            </div>
          )}
        </DialogContent>
      </Dialog>
    </div>
  );
}
