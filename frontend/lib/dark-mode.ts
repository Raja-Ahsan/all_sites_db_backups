import api from "./api";

/**
 * Determine preferred dark mode based on OS if nothing stored
 */
export function getPreferredDark(): boolean {
  if (typeof window === "undefined") return false;
  try {
    return window.matchMedia && window.matchMedia("(prefers-color-scheme: dark)").matches;
  } catch {
    return false;
  }
}

/** Apply or remove the `dark` class on <html> */
export function applyDarkClass(isDark: boolean) {
  if (typeof document === "undefined") return;
  const root = document.documentElement;
  if (isDark) root.classList.add("dark");
  else root.classList.remove("dark");
}

/** Get dark mode from localStorage or OS preference */
export function getDarkModeSync(): boolean {
  if (typeof window === "undefined") return false;
  try {
    const ls = localStorage.getItem("dark_mode");
    const theme = localStorage.getItem("theme");
    if (ls === "true") return true;
    if (ls === "false") return false;
    if (theme === "dark") return true;
    if (theme === "light") return false;
  } catch {}
  return getPreferredDark();
}

/** Fetch dark mode from server settings; returns boolean or null if missing */
export async function getDarkMode(): Promise<boolean | null> {
  try {
    const res = await api.get("/settings/dark_mode");
    if (res.status === 200 && res.data?.success) {
      const val = res.data.data;
      if (typeof val === "boolean") return val;
    }
  } catch {
    // ignore; setting may not exist yet
  }
  return null;
}

/** Persist dark mode to server and localStorage, and apply class */
export async function setDarkMode(isDark: boolean): Promise<void> {
  try {
    // Optimistically update UI and local storage
    applyDarkClass(isDark);
    try {
      localStorage.setItem("dark_mode", isDark ? "true" : "false");
      localStorage.setItem("theme", isDark ? "dark" : "light");
    } catch {}
    await api.put("/settings/dark_mode", {
      value: isDark,
      description: "Dark mode preference (boolean)",
    });
  } catch {
    // On failure, keep UI state but do not throw
  }
}
