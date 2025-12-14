"use client";

import { useEffect } from "react";
import { useRouter } from "next/navigation";
import { isAuthenticated, getDashboardRoute, getCurrentUser } from "@/lib/auth";
import Link from "next/link";

export default function HomePage() {
    const router = useRouter();

    useEffect(() => {
        // If user is authenticated, redirect to their dashboard
        if (isAuthenticated()) {
            const user = getCurrentUser();
            if (user) {
                const dashboardRoute = getDashboardRoute(user);
                router.push(dashboardRoute);
            }
        }
    }, [router]);

    return (
        <div className="flex min-h-screen flex-col items-center justify-center p-24 bg-gradient-to-br from-blue-50 to-indigo-100 dark:from-gray-900 dark:to-gray-800">
            <div className="text-center max-w-2xl">
                <h1 className="text-5xl font-bold mb-6 text-gray-900 dark:text-white">
                    Welcome to EmeraldRx HRM
                </h1>
                <p className="text-xl text-gray-600 dark:text-gray-300 mb-8">
                    Comprehensive HR Management System for Compounding Pharmacy
                </p>
                <div className="flex gap-4 justify-center">
                    <Link
                        href="/login"
                        className="bg-blue-600 text-white px-6 py-3 rounded-md hover:bg-blue-700 transition-colors font-semibold"
                    >
                        Sign In
                    </Link>
                </div>
            </div>
        </div>
    );
}