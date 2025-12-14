import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { Providers } from "@/components/providers";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
    title: "EmeraldRx HR Management System",
    description: "Comprehensive HR Management System for EmeraldRx Pharmacy",
};

/**
 * Root layout - wraps entire application
 * Sidebar is handled by (main) route group layout
 */
export default function RootLayout({
                                       children,
                                   }: {
    children: React.ReactNode;
}) {
    return (
        <html lang="en" suppressHydrationWarning>
        <head>
            <script
                dangerouslySetInnerHTML={{
                    __html: `
              (function() {
                try {
                  var apiUrl = 'http://localhost:5000';
                  
                  if (window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1') {
                    apiUrl = 'http://localhost:5000';
                  } else if (window.location.hostname === 'emeraldsrxhr.sitestaginglink.com') {
                    apiUrl = window.location.origin;
                  } else {
                    apiUrl = window.location.origin;
                  }
                  
                  // Apply dark mode early
                  try {
                    var ls = null;
                    try { ls = localStorage.getItem('dark_mode'); } catch (_) {}
                    var themePref = null;
                    try { themePref = localStorage.getItem('theme'); } catch (_) {}
                    var prefersDark = false;
                    try { prefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches; } catch (_) {}
                    var isDark = (ls === 'true') ? true
                              : (ls === 'false') ? false
                              : (themePref === 'dark') ? true
                              : (themePref === 'light') ? false
                              : prefersDark;
                    if (isDark) {
                      document.documentElement.classList.add('dark');
                    } else {
                      document.documentElement.classList.remove('dark');
                    }
                  } catch (e) {}
                  
                  // Fetch theme synchronously
                  try {
                    var themeXhr = new XMLHttpRequest();
                    themeXhr.open('GET', apiUrl + '/api/settings/sidebar_theme', false);
                    themeXhr.send();
                    
                    if (themeXhr.status === 200) {
                      var themeData = JSON.parse(themeXhr.responseText);
                      if (themeData.success && themeData.data) {
                        window.__SIDEBAR_THEME__ = themeData.data;
                        window.__SIDEBAR_THEME_LOADED__ = true;
                      }
                    }
                  } catch (e) {
                    window.__SIDEBAR_THEME_LOADED__ = false;
                  }
                  
                  // Fetch dark mode setting
                  try {
                    var darkXhr = new XMLHttpRequest();
                    darkXhr.open('GET', apiUrl + '/api/settings/dark_mode', false);
                    darkXhr.send();
                    if (darkXhr.status === 200) {
                      var darkData = JSON.parse(darkXhr.responseText);
                      if (darkData && darkData.success) {
                        var darkVal = darkData.data;
                        if (typeof darkVal === 'boolean') {
                          if (darkVal) {
                            document.documentElement.classList.add('dark');
                            try { localStorage.setItem('dark_mode', 'true'); localStorage.setItem('theme', 'dark'); } catch (_) {}
                          } else {
                            document.documentElement.classList.remove('dark');
                            try { localStorage.setItem('dark_mode', 'false'); localStorage.setItem('theme', 'light'); } catch (_) {}
                          }
                        }
                      }
                    }
                  } catch (e) {}
                  
                  // Fetch logo synchronously
                  try {
                    var logoXhr = new XMLHttpRequest();
                    logoXhr.open('GET', apiUrl + '/api/settings/sidebar_logo', false);
                    logoXhr.send();
                    
                    if (logoXhr.status === 200) {
                      var logoData = JSON.parse(logoXhr.responseText);
                      if (logoData.success) {
                        window.__SIDEBAR_LOGO__ = logoData.data;
                        window.__SIDEBAR_LOGO_LOADED__ = true;
                      }
                    }
                  } catch (e) {
                    window.__SIDEBAR_LOGO_LOADED__ = false;
                  }
                } catch (e) {
                  window.__SIDEBAR_THEME__ = null;
                  window.__SIDEBAR_LOGO__ = null;
                  window.__SIDEBAR_THEME_LOADED__ = false;
                  window.__SIDEBAR_LOGO_LOADED__ = false;
                }
              })();
            `,
                }}
            />
        </head>
        <body className={inter.className}>
        <Providers>{children}</Providers>
        </body>
        </html>
    );
}