﻿#pragma checksum "..\..\..\Views\BranchPayrollItemBreakDown.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "8F337DC5A0CF093348D93A2B54F18AFC"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using PayrollManager;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace PayrollManager {
    
    
    /// <summary>
    /// BranchPayrollItemBreakDown
    /// </summary>
    public partial class BranchPayrollItemBreakDown : System.Windows.Controls.UserControl, System.Windows.Markup.IComponentConnector {
        
        
        #line 14 "..\..\..\Views\BranchPayrollItemBreakDown.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid LayoutRoot;
        
        #line default
        #line hidden
        
        
        #line 15 "..\..\..\Views\BranchPayrollItemBreakDown.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Border ReportBRD;
        
        #line default
        #line hidden
        
        
        #line 16 "..\..\..\Views\BranchPayrollItemBreakDown.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ScrollViewer ReportGrd;
        
        #line default
        #line hidden
        
        
        #line 17 "..\..\..\Views\BranchPayrollItemBreakDown.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid DailyReportGD;
        
        #line default
        #line hidden
        
        
        #line 29 "..\..\..\Views\BranchPayrollItemBreakDown.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid GridData;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/PayrollManager;component/views/branchpayrollitembreakdown.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Views\BranchPayrollItemBreakDown.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.LayoutRoot = ((System.Windows.Controls.Grid)(target));
            return;
            case 2:
            this.ReportBRD = ((System.Windows.Controls.Border)(target));
            return;
            case 3:
            this.ReportGrd = ((System.Windows.Controls.ScrollViewer)(target));
            return;
            case 4:
            this.DailyReportGD = ((System.Windows.Controls.Grid)(target));
            return;
            case 5:
            this.GridData = ((System.Windows.Controls.DataGrid)(target));
            
            #line 31 "..\..\..\Views\BranchPayrollItemBreakDown.xaml"
            this.GridData.LoadingRow += new System.EventHandler<System.Windows.Controls.DataGridRowEventArgs>(this.GridData_LoadingRow);
            
            #line default
            #line hidden
            return;
            case 6:
            
            #line 46 "..\..\..\Views\BranchPayrollItemBreakDown.xaml"
            ((System.Windows.Controls.TextBlock)(target)).MouseLeftButtonDown += new System.Windows.Input.MouseButtonEventHandler(this.PrintReport);
            
            #line default
            #line hidden
            return;
            case 7:
            
            #line 49 "..\..\..\Views\BranchPayrollItemBreakDown.xaml"
            ((System.Windows.Controls.TextBlock)(target)).MouseLeftButtonDown += new System.Windows.Input.MouseButtonEventHandler(this.ExcelReport);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

