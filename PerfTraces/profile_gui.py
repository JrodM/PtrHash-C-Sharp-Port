#!/usr/bin/env python3

import tkinter as tk
from tkinter import ttk, messagebox, filedialog
import subprocess
import os
import threading
from datetime import datetime

class PtrHashProfilerGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("PtrHash Construction Profiler")
        self.root.geometry("600x500")
        
        # Get script directory
        self.script_dir = os.path.dirname(os.path.abspath(__file__))
        self.project_dir = os.path.join(self.script_dir, "ConstructionProfiler")
        self.output_dir = os.path.join(self.script_dir, "ProfileResults")
        
        self.setup_ui()
        self.check_dependencies()
    
    def setup_ui(self):
        # Main frame
        main_frame = ttk.Frame(self.root, padding="10")
        main_frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        
        # Title
        title_label = ttk.Label(main_frame, text="PtrHash Construction Profiler", 
                               font=("Arial", 16, "bold"))
        title_label.grid(row=0, column=0, columnspan=2, pady=(0, 20))
        
        # Status frame
        status_frame = ttk.LabelFrame(main_frame, text="Status", padding="10")
        status_frame.grid(row=1, column=0, columnspan=2, sticky=(tk.W, tk.E), pady=(0, 10))
        
        self.status_text = tk.Text(status_frame, height=8, width=70)
        status_scrollbar = ttk.Scrollbar(status_frame, orient="vertical", command=self.status_text.yview)
        self.status_text.configure(yscrollcommand=status_scrollbar.set)
        
        self.status_text.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        status_scrollbar.grid(row=0, column=1, sticky=(tk.N, tk.S))
        
        # Options frame
        options_frame = ttk.LabelFrame(main_frame, text="Options", padding="10")
        options_frame.grid(row=2, column=0, columnspan=2, sticky=(tk.W, tk.E), pady=(0, 10))
        
        self.enable_debug = tk.BooleanVar(value=True)
        debug_check = ttk.Checkbutton(options_frame, text="Enable construction debugging", 
                                     variable=self.enable_debug)
        debug_check.grid(row=0, column=0, sticky=tk.W)
        
        self.profile_mode = tk.StringVar(value="dotTrace")
        ttk.Label(options_frame, text="Profiling Mode:").grid(row=1, column=0, sticky=tk.W, pady=(10, 0))
        
        mode_frame = ttk.Frame(options_frame)
        mode_frame.grid(row=2, column=0, sticky=tk.W, pady=(5, 0))
        
        ttk.Radiobutton(mode_frame, text="dotTrace Timeline", variable=self.profile_mode, 
                       value="dotTrace").grid(row=0, column=0, sticky=tk.W)
        ttk.Radiobutton(mode_frame, text="Manual Timing", variable=self.profile_mode, 
                       value="manual").grid(row=0, column=1, sticky=tk.W, padx=(20, 0))
        
        # Buttons frame
        buttons_frame = ttk.Frame(main_frame)
        buttons_frame.grid(row=3, column=0, columnspan=2, pady=(0, 10))
        
        self.build_button = ttk.Button(buttons_frame, text="Build Project", command=self.build_project)
        self.build_button.grid(row=0, column=0, padx=(0, 10))
        
        self.profile_button = ttk.Button(buttons_frame, text="Start Profiling", 
                                        command=self.start_profiling, state="disabled")
        self.profile_button.grid(row=0, column=1, padx=(0, 10))
        
        self.open_results_button = ttk.Button(buttons_frame, text="Open Results Folder", 
                                             command=self.open_results_folder)
        self.open_results_button.grid(row=0, column=2)
        
        # Progress bar
        self.progress = ttk.Progressbar(main_frame, mode='indeterminate')
        self.progress.grid(row=4, column=0, columnspan=2, sticky=(tk.W, tk.E), pady=(0, 10))
        
        # Configure column weights
        main_frame.columnconfigure(0, weight=1)
        self.root.columnconfigure(0, weight=1)
        self.root.rowconfigure(0, weight=1)
    
    def log_message(self, message):
        timestamp = datetime.now().strftime("%H:%M:%S")
        self.status_text.insert(tk.END, f"[{timestamp}] {message}\n")
        self.status_text.see(tk.END)
        self.root.update()
    
    def check_dependencies(self):
        self.log_message("Checking dependencies...")
        
        # Check .NET
        try:
            result = subprocess.run(["dotnet", "--version"], capture_output=True, text=True)
            if result.returncode == 0:
                self.log_message(f"✓ .NET found: {result.stdout.strip()}")
            else:
                self.log_message("✗ .NET not found")
                return
        except FileNotFoundError:
            self.log_message("✗ .NET not found")
            return
        
        # Check dotTrace
        try:
            result = subprocess.run(["dottrace", "--help"], capture_output=True, text=True)
            if result.returncode == 0:
                self.log_message("✓ dotTrace command line tools found")
            else:
                self.log_message("⚠ dotTrace command line tools not found (manual mode available)")
        except FileNotFoundError:
            self.log_message("⚠ dotTrace command line tools not found (manual mode available)")
        
        # Check project
        if os.path.exists(self.project_dir):
            self.log_message(f"✓ Project directory found: {self.project_dir}")
        else:
            self.log_message(f"✗ Project directory not found: {self.project_dir}")
            return
        
        self.log_message("Ready to build and profile!")
    
    def build_project(self):
        def build_thread():
            try:
                self.progress.start()
                self.build_button.config(state="disabled")
                
                self.log_message("Building ConstructionProfiler...")
                
                result = subprocess.run(
                    ["dotnet", "build", "-c", "Release"],
                    cwd=self.project_dir,
                    capture_output=True,
                    text=True
                )
                
                if result.returncode == 0:
                    self.log_message("✓ Build successful!")
                    self.profile_button.config(state="normal")
                else:
                    self.log_message(f"✗ Build failed:\n{result.stderr}")
                
            except Exception as e:
                self.log_message(f"✗ Build error: {str(e)}")
            finally:
                self.progress.stop()
                self.build_button.config(state="normal")
        
        threading.Thread(target=build_thread, daemon=True).start()
    
    def start_profiling(self):
        def profile_thread():
            try:
                self.progress.start()
                self.profile_button.config(state="disabled")
                
                os.makedirs(self.output_dir, exist_ok=True)
                
                if self.profile_mode.get() == "dotTrace":
                    self.run_dottrace_profiling()
                else:
                    self.run_manual_profiling()
                
            except Exception as e:
                self.log_message(f"✗ Profiling error: {str(e)}")
            finally:
                self.progress.stop()
                self.profile_button.config(state="normal")
        
        threading.Thread(target=profile_thread, daemon=True).start()
    
    def run_dottrace_profiling(self):
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        profile_output = os.path.join(self.output_dir, f"construction_profile_{timestamp}.dtp")
        
        self.log_message("Starting dotTrace profiling...")
        self.log_message(f"Profile will be saved to: {profile_output}")
        
        exe_path = os.path.join(self.project_dir, "bin", "Release", "net8.0", "ConstructionProfiler.dll")
        
        result = subprocess.run([
            "dottrace", 
            f"save-to={profile_output}",
            "--profiling-type=Timeline",
            "--collect-at=Start",
            "--",
            "dotnet", exe_path
        ], capture_output=True, text=True)
        
        if result.returncode == 0:
            self.log_message("✓ Profiling completed successfully!")
            self.log_message(f"Profile saved to: {profile_output}")
        else:
            self.log_message(f"✗ Profiling failed:\n{result.stderr}")
    
    def run_manual_profiling(self):
        self.log_message("Starting manual profiling (timing only)...")
        
        exe_path = os.path.join(self.project_dir, "bin", "Release", "net8.0", "ConstructionProfiler.dll")
        
        # Run the profiler and capture output
        process = subprocess.Popen(
            ["dotnet", exe_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            bufsize=1,
            universal_newlines=True
        )
        
        # Read output in real-time
        while True:
            output = process.stdout.readline()
            if output == '' and process.poll() is not None:
                break
            if output:
                self.log_message(output.strip())
        
        if process.returncode == 0:
            self.log_message("✓ Manual profiling completed!")
        else:
            stderr = process.stderr.read()
            self.log_message(f"✗ Manual profiling failed:\n{stderr}")
    
    def open_results_folder(self):
        if os.path.exists(self.output_dir):
            if os.name == 'nt':  # Windows
                os.startfile(self.output_dir)
            elif os.name == 'posix':  # Linux/Mac
                subprocess.run(["xdg-open", self.output_dir])
        else:
            messagebox.showwarning("Warning", f"Results folder does not exist: {self.output_dir}")

if __name__ == "__main__":
    root = tk.Tk()
    app = PtrHashProfilerGUI(root)
    root.mainloop()