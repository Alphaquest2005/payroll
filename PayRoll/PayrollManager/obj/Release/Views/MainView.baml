   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  ;"clr-namespace:PayrollManager.ViewsPayrollManager.Views  O Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem     PayrollManager.MainView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  h dMicrosoft.Expression.Interactions, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bic9http://schemas.microsoft.com/expression/2010/interactions  (localclr-namespace:PayrollManager  2	localview"clr-namespace:PayrollManager.Views  3System&clr-namespace:System;assembly=mscorlib  &   System.Windows.Media.TextOptions    TextRenderingMode$  	ClearType=� � 	Resources "   PayrollManager.BaseViewModel   BaseModelViewDataSource  ExpHeadFontSize  ExpHeadStyle �� 
TargetType �� Property �� Value �� Triggers P� Property P� Value��%�   &	        &	      &	        X�16Q��� " ��.���  � �� �	#FFECF9A7 P�  �@J�IsMouseOver . . ���  � �� �	#FF8E9600.��� -    �Name$ 
LayoutRoot��$��1,0,-1,0q�	 � DataContext	 �� 
 �� Source#
 [  ��Z� .+��� $
��Left=�$��70��$��	116,0,0,0q�$
��Wrap=�$��Payroll Manager��$	��Top=�$	��463��$��48(�$��Segoe UI Light)��� $��116,70,26,0q�$��0,0,0,1q�$��55��$	��Top=�$��2������  �� EndPoint$ 0.5,1&� � MappingMode$ RelativeToBoundingBox=� �� 
StartPoint$ 0.5,0&�.���  � Color$ 	#00000000�� � Offset$ 0.878Q�� $ White��$ 1Q�� $ 	#7F0F326F��$ 1Q�._�� $��0,0,-0.6,0.2q�	 �� .+���  �� DisplayMemberPath$
 Name��$
��Left=�$	��Top=�$��23.916��$	��300��$��13.333(�$��0,10,0,0q� �� Text �� *CurrentBranch.Name+���� *
Branches+ �� SelectedItem �� *CurrentBranch+ �� Mode$ OneWayToSource=� �� UpdateSourceTrigger$ PropertyChanged=���Z� ��Z� �� $��899.813,7.818,-142.668,0q�$
��Left=�$	��Top=�$��32��$��117.284��$��13.333(����	#FFFFFED6���� *CurrentPayrollJob.NetAmount+ �� StringFormat$ c���� $
��Left=�$��31.994��$��819.513,7.818,-20.384,0q�$
��Wrap=�$��Net Amt:��$	��Top=�$
��75.3��$��13.333(����	#FFFFFED6�� $��	392,8,0,0q�$
��Left=�$	��Top=�$��32��$��50��$��14(����	#FFFFFED6���� *CurrentBranch.TotalEmployees+�� $
��Left=�$��32��$��
337,10,0,0q�$
��Wrap=�$
��Emp#��$	��Top=�$��50��$��13.333(� J� RenderTransformOrigin$ -1.217,0.371&����	#FFFFFED6�� $��593.122,10,0,0q�$
��Left=�$	��Top=�$��23.916��$��191.271��$��13.333(����	#FFFFFED6���� *CurrentPayrollJob.Name+ �� FallbackValue$ Select payroll job���� $
��Left=�$��39.812��$��512.822,0,0,0q�$
��Wrap=�$��Current Payroll Job��$	��Top=�$
��75.3��$��13.333(����	#FFFFFED6    PayrollManager.SliderPanel  -     Name$ slider��$��	0,125,0,0q����	#00B76767$��20000��$��2��.+���  �� Orientation$ 
Horizontal=�$��Stretch=� � LayoutTransform V� .~���  �� ScaleX$	 .75Q� �� ScaleY$
 0.75Q��� �� T� .+�9� -    9�Name$ IntroEXP�� 9� ExpandDirection$ Right=�$��1q�$
��Left=�$	��495��$��
100,10,0,0q�$	��Top=�$
��Auto�� 9� 
IsExpanded . ��� -   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��	0,10,14,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��Select Payroll Job��#���  $��Right=�$��0,65,13,174.36q�$
��Wrap=�$��65��  �� TextAlignment$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��&    PayrollManager.Views.IntroScreen  &    PayrollManager.Views.IntroScreen!   
MouseEnter$! BringIntoView��$��0q�9� -   $ PayrollJobBDR��$ Right=�$��50,10,0,-110q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q���� -   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��0,1,14,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��26��#���  $	��Top=�$��Right=�$��0,34,0,0q�$��36��$��Segoe UI Symbol)�$0��*20                                        (�$	������ $��Create New Payroll Job��#���  $��Right=�$��0,65,10,175.52q�$
��Wrap=�$��65��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��   PayrollManager.PayrollJob     PayrollManager.PayrollJob"   
MouseEnter$" BringIntoView��$	��Top=�9� -   $# BranchPayrollItemBreakDownEXP��$ Right=�$��50,10,0,-110q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q���� -   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��0,1,14,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��26��#���  $	��Top=�$��Right=�$��0,34,0,0q�$��36��$��Segoe UI Symbol)�$0��*20                                        (�$	������ $��Company Summary Report��#���  $��Right=�$��0,65,0,175.64q�$
��Wrap=�$��75��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��/   )PayrollManager.BranchPayrollItemBreakDown  /	   )PayrollManager.BranchPayrollItemBreakDown# 	  
MouseEnter$# BringIntoView��$	��Top=�9� -	   $" BranchEmployeeInstitutionEXP��$ Right=�$��50,10,0,-110q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q���� -
   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��0,1,14,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��26��#���  $	��Top=�$��Right=�$��0,34,0,0q�$��36��$��Segoe UI Symbol)�$0��*20                                        (�$	������ $��All Employee Institutions��#���  $��Right=�$��-13,58,-9.8,182.2q�$
��Wrap=�$��98��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��/
   )PayrollManager.BranchEmployeeInstitutions
  /   )PayrollManager.BranchEmployeeInstitutions$   
MouseEnter$$ BringIntoView��$	��Top=�9� -   $ EmployeeBreakDownEXP��$ Right=�$��50,10,0,-110q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q���� -   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��0,1,14,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��26��#���  $	��Top=�$��Right=�$��0,34,0,0q�$��36��$��Segoe UI Symbol)�$0��*20                                        (�$	������ $'��!Payroll Employee Breakdown Report��#���  $��Right=�$��0,65,0,175.6q�$
��Wrap=�$��90��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��,   &PayrollManager.EmployeeBreakDownReport  ,   &PayrollManager.EmployeeBreakDownReport%   
MouseEnter$% BringIntoView��$	��Top=�9� -   $ PayrollItemsReportEXP��$ Right=�$��50,10,0,-110q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q���� -   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��0,1,14,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��26��#���  $	��Top=�$��Right=�$��0,34,0,0q�$��36��$��Segoe UI Symbol)�$0��*20                                        (�$	������ $"��Payroll Items Summary Report��#���  $��Right=�$��0,65,0,175.64q�$
��Wrap=�$��75��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��'   !PayrollManager.PayrollItemsReport  '   !PayrollManager.PayrollItemsReport&   
MouseEnter$& BringIntoView��$	��Top=�9� -   $ EmployeeSummaryListEXP��$ Right=�$��600,010,0,0q�$
��Auto��$	��495��$
��Left=�$	��Top=� . ��� -   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��	0,10,23,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��Employee Summary List��#���  $��Right=�$��72��$��0,75,23,309q�$
��Wrap=�$��Bottom=�$��77��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��(   "PayrollManager.EmployeeSummaryList  (   "PayrollManager.EmployeeSummaryList'   
MouseEnter$' BringIntoView��$��0,0,0,0q�9� -   $! EmployeePayrollItemsListEXP��$ Right=�$��100,10,0,-120q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q� . ��� -   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��0,2,22,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��25��#���  $	��Top=�$��Right=�$��	0,39,14,0q�$��26��$��Segoe UI Symbol)�$��20(�$	������ $��Employee Payroll Items��#���  $��Right=�$��-12,65,10,175.24q�$
��Wrap=�$��79��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��-   'PayrollManager.EmployeePayrollItemsList  -   'PayrollManager.EmployeePayrollItemsList(   
MouseEnter$( BringIntoView��$��0q�9� -   $ PayrollItemDetailsEXP��$ Right=�$��100,10,0,-210q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q���� -   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��	0,-3,23,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��31��#���  $	��Top=�$��Right=�$��	0,34,20,0q�$��23��$��Segoe UI Symbol)�$��20(�$	������ $��Edit Payroll Item Details��#���  $��Right=�$��	0,65,10,0q�$
��Wrap=�$��65��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��'   !PayrollManager.PayrollItemDetails  '   !PayrollManager.PayrollItemDetails)   
MouseEnter$) BringIntoView��$��0q�9� -   $$ PayCheckEmployeeSummaryListEXP��$ Right=�$��600,010,0,0q�$
��Auto��$	��495��$
��Left=�$	��Top=� . ��� -   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��	0,10,23,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��Employee Summary List��#���  $��Right=�$��72��$��0,60,23,309q�$
��Wrap=�$��Bottom=�$��77��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��  $' BringIntoView��$��0,0,0,0q�9� -   $ PayCheckViewEXP��$ Right=�$��	50,10,0,0q�$
��Auto��$	��535��$
��Left=�$	��Top=�$��5,5,5,10q� .  ��� -   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��	0,10,23,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��Check Preview��#���  $��Right=�$��-5,65,18,171.88q�$
��Wrap=�$��65��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��!   PayrollManager.PayCheckView  !   PayrollManager.PayCheckView*   
MouseEnter$* BringIntoView��$��0q�9� -   $ EmployeePayStubEXP��$ Right=�$��	50,10,0,0q�$
��Auto��$	��535��$
��Left=�$	��Top=�$��5,5,5,10q� . ��� -   $
��Auto��.+��� $��63��#���  $	��Top=�$
��Left=�$��0,1,0,0q�$��55��$��Segoe UI Symbol)�$��40(��� $	����� $��31��#���  $	��Top=�$��Right=�$��23��$��Segoe UI Symbol)�$��20(�$	����$ 1.539,0.781&�$��	0,44,11,0q��� $��Employee PayStub��#���  $��Right=�$��-5,65,0,171.72q�$
��Wrap=�$��83��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��#   PayrollManager.EmployeePaysub  #   PayrollManager.EmployeePaysub+   
MouseEnter$+ BringIntoView��$��0q�9� -   $ AccountsSummaryEXP��$ Right=� . $��600,10,0,-210q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q���� -   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��	0,10,23,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��Accounts��#���  $��Right=�$��-16,65,10,0q�$
��Wrap=�$��84��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��$   PayrollManager.AccountsSummary  $   PayrollManager.AccountsSummary,   
MouseEnter$, BringIntoView��$��0q�9� -   $ AccountsSummaryReportEXP��$ Right=� . $��100,10,0,-210q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q���� -   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��
-4,-2,27,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��31��#���  $	��Top=�$��Right=�$��	0,34,20,0q�$��23��$��Segoe UI Symbol)�$��20(�$	������ $��Accounts Summary Report��#���  $��Right=�$��
-16,65,0,0q�$
��Wrap=�$��94��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��*   $PayrollManager.AccountsSummaryReport  *   $PayrollManager.AccountsSummaryReport-   
MouseEnter$- BringIntoView��$��0q�9� -   $ 	PaysubEXP��$ Right=� . $��100,10,0,-210q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q���� -    $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��
-4,-2,27,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��31��#���  $	��Top=�$��Right=�$��	0,34,20,0q�$��23��$��Segoe UI Symbol)�$��20(�$	������ $��Payments BreakDown��#���  $��Right=�$��
-16,65,0,0q�$
��Wrap=�$��94��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��   PayrollManager.Paysub     PayrollManager.Paysub.   
MouseEnter$. BringIntoView��$��0q�9� -!   $ AccountDetailsEXP��$ Right=�$��100,10,0,-210q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q���� -"   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��	0,10,23,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��Add/Edit Accounts��#���  $��Right=�$��-6,64,6,174.16q�$
��Wrap=�$��78��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��#    PayrollManager.AccountDetails   #!   PayrollManager.AccountDetails/ !  
MouseEnter$/ BringIntoView��$��0q�9� -#   $ PayrollSetupSummaryEXP�� . $ Right=�$��
600,10,0,0q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q���� -$   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��0,4,23,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��Setup Payroll List��#���  $��Right=�$��0,65,10,175.4q�$
��Wrap=�$��65��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��("   "PayrollManager.PayrollSetupSummary"  (#   "PayrollManager.PayrollSetupSummary0 #  
MouseEnter$0 BringIntoView��$��0q�9� -%   $ PayrollSetupItemsEXP��$ Right=� . $��
100,10,0,0q�$
��Auto��$	��495��$
��Left=�$	��Top=�$��5,5,5,10q���� -&   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��0,3,13,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��Add/Edit Payroll Setup��#���  $��Right=�$��0,65,10,175.4q�$
��Wrap=�$��65��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��&$    PayrollManager.PayrollSetupItems$  &%    PayrollManager.PayrollSetupItems1 %  
MouseEnter$1 BringIntoView��$��0q�9� -'   $ EmployeeSetupListEXP�� . $ Right=�$��600,010,0,0q�$
��Auto��$	��493��$
��Left=�$	��Top=�$ 0.5,0.5&�z�V� .~��� �� 2 �� AngleX$2 0.412Q��� T� 3 T� X$3 1.593Q���� -(   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��	0,10,23,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��Employee Summary List��#���  $��Right=�$��72��$��0,60,23,309q�$
��Wrap=�$��Bottom=�$��77��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��  $' BringIntoView��$��0,0,0,0q�9� -)   $ EmployeeDetailsEXP�� . $ Right=�$��50,10,0,-110q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q���� -*   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��	0,10,23,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��Add Edit Employee Details��#���  $��Right=�$��0,65,0,175.24q�$
��Wrap=�$��75��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��$&   PayrollManager.EmployeeDetails&  $'   PayrollManager.EmployeeDetails4 '  
MouseEnter$4 BringIntoView��$��0q�9� -+   $# EmployeeAccountSummaryListEXP�� . $ Right=�$��50,10,0,-210q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q���� -,   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��0,4,23,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��30��#���  $	��Top=�$��Right=�$��	0,40,16,0q�$��26��$��Segoe UI Symbol)�$��20(�$	������ $��Employee Accounts List��#���  $��Right=�$��-15,65,10,175.52q�$
��Wrap=�$��83��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��/(   )PayrollManager.EmployeeAccountSummaryList(  /)   )PayrollManager.EmployeeAccountSummaryList5 )  
MouseEnter$5 BringIntoView��$��0q�9� --   $ EmployeeAccountDetailsEXP�� . $ Right=�$��50,10,0,-210q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q���� -.   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��0,4,23,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��30��#���  $	��Top=�$��Right=�$��	0,40,16,0q�$��26��$��Segoe UI Symbol)�$��20(�$	������ $(��"Add/Edit Employee Payroll Accounts��#���  $��Right=�$��-13,65,10,175.64q�$
��Wrap=�$��81��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��+*   %PayrollManager.EmployeeAccountDetails*  ++   %PayrollManager.EmployeeAccountDetails6 +  
MouseEnter$6 BringIntoView��$��0q�9� -/   $$ PayrollEmployeeSetupDetailsBDR�� . $ Right=�$��50,10,0,-210q�$
��Auto��$	��500��$
��Left=�$	��Top=�$��5,5,5,10q���� -0   $
��Auto��.+��� $��63��#���  $	��Top=�$��Right=�$��0,4,23,0q�$��55��$��Segoe UI Symbol)�$��40(�$	������ $��30��#���  $	��Top=�$��Right=�$��	0,40,16,0q�$��26��$��Segoe UI Symbol)�$��20(�$	������ $&�� Configure Employee Payroll items��#���  $��Right=�$��0,65,0,175.8q�$
��Wrap=�$��75��$  Center=�$ 
0.535,1.32&�#���  $
��Bold"�.��0,   *PayrollManager.PayrollEmployeeSetupDetails,  0-   *PayrollManager.PayrollEmployeeSetupDetails7 -  
MouseEnter$7 BringIntoView��$��0q��� -1   8 ��Name$8 BackBtn��$
��Left=�$��70��$��	10,34,0,0q�$
��Wrap=�$	����$	��Top=�$��70��$��48(�$��Segoe UI Symbol)�$  Center=�  TextButtonStyle#���  ���	#00000000