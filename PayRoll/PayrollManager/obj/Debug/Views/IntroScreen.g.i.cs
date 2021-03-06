﻿#pragma checksum "..\..\..\Views\IntroScreen.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "ACFE960ED30722219810154A043078AA"
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


namespace PayrollManager.Views {
    
    
    /// <summary>
    /// IntroScreen
    /// </summary>
    public partial class IntroScreen : System.Windows.Controls.UserControl, System.Windows.Markup.IComponentConnector {
        
        
        #line 34 "..\..\..\Views\IntroScreen.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid LayoutRoot;
        
        #line default
        #line hidden
        
        
        #line 37 "..\..\..\Views\IntroScreen.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock StartJobBtn;
        
        #line default
        #line hidden
        
        
        #line 38 "..\..\..\Views\IntroScreen.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock ConfigPayItemsBtn;
        
        #line default
        #line hidden
        
        
        #line 39 "..\..\..\Views\IntroScreen.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Documents.Run PayrollBtn;
        
        #line default
        #line hidden
        
        
        #line 40 "..\..\..\Views\IntroScreen.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Documents.Run GenPayrollBtn;
        
        #line default
        #line hidden
        
        
        #line 41 "..\..\..\Views\IntroScreen.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Documents.Run PostPayrollBtn1;
        
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
            System.Uri resourceLocater = new System.Uri("/PayrollManager;component/views/introscreen.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Views\IntroScreen.xaml"
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
            
            #line 35 "..\..\..\Views\IntroScreen.xaml"
            ((System.Windows.Controls.ListBox)(target)).SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.Selector_OnSelectionChanged);
            
            #line default
            #line hidden
            return;
            case 3:
            this.StartJobBtn = ((System.Windows.Controls.TextBlock)(target));
            
            #line 37 "..\..\..\Views\IntroScreen.xaml"
            this.StartJobBtn.MouseLeftButtonDown += new System.Windows.Input.MouseButtonEventHandler(this.StartJobBtn_MouseLeftButtonDown);
            
            #line default
            #line hidden
            return;
            case 4:
            this.ConfigPayItemsBtn = ((System.Windows.Controls.TextBlock)(target));
            
            #line 38 "..\..\..\Views\IntroScreen.xaml"
            this.ConfigPayItemsBtn.MouseLeftButtonDown += new System.Windows.Input.MouseButtonEventHandler(this.ConfigPayItemsBtn_MouseLeftButtonDown);
            
            #line default
            #line hidden
            return;
            case 5:
            this.PayrollBtn = ((System.Windows.Documents.Run)(target));
            
            #line 39 "..\..\..\Views\IntroScreen.xaml"
            this.PayrollBtn.MouseLeftButtonDown += new System.Windows.Input.MouseButtonEventHandler(this.PayrollBtn_MouseLeftButtonDown);
            
            #line default
            #line hidden
            return;
            case 6:
            this.GenPayrollBtn = ((System.Windows.Documents.Run)(target));
            
            #line 40 "..\..\..\Views\IntroScreen.xaml"
            this.GenPayrollBtn.MouseLeftButtonDown += new System.Windows.Input.MouseButtonEventHandler(this.GenPayrollBtn_MouseLeftButtonDown_1);
            
            #line default
            #line hidden
            return;
            case 7:
            this.PostPayrollBtn1 = ((System.Windows.Documents.Run)(target));
            
            #line 41 "..\..\..\Views\IntroScreen.xaml"
            this.PostPayrollBtn1.MouseLeftButtonDown += new System.Windows.Input.MouseButtonEventHandler(this.PostPayrollBtn_MouseLeftButtonDown_1);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

