   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  (    "PayrollManager.EmployeeSummaryList   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager     $��522.274��$��652.991��$	��Top=�  � 	Resources  -   'PayrollManager.EmployeeSummaryListModel &  "EmployeeSummaryListModelDataSource  EmployeeSummaryIDT �� EndPoint �� 
StartPoint � Color � Offset �� ContentStringFormat �� StringFormat �� TextAlignment �� 
TargetType  TransparentTextBoxStyle	 �� Property
 �� Value �� 
TargetType ��Name��%C  &	        &	      &	 }      �� .R�� $��79��$��615.2������ $ 0.5,1&�$ 0.5,0&�.��� $ 	#33000000��$ 0.907Q�� $ 	#19FFFFFF��$ 0.069Q�.+��� $��	10,10,0,0q�$
��Left=�$	��Top=�$��37��$	��338��$��18.667(����� *DisplayName+�� $��
353,10,0,0q�$
��Left=�$	��Top=�$��32��$	��112��$��21.333(����� *Title+�� $��
470,16,0,0q�$
��Left=�$	��Top=�$��53��$	��118��$��24(�$��Center=�$ c������ *	NetAmount+�� $��105.671,47.453,0,0q�$
��Left=�$	��Top=�$��21.342��$��151.642��$��16(����� *TotalIncome+$ c���� $��
366,47,0,0q�$
��Left=�$	��Top=�$��22��$��99��$��16(����� *TotalDeductions+$ c���� $
��Left=�$��16��$��0,50,0,0q�$
��Wrap=�$��Income��$	��Top=�$��90��$ Right=�$��14(��� $
��Left=�$��16��$��
267,51,0,0q�$
��Wrap=�$��
Deductions��$	��Top=�$��81��$ Right=�$��14(��� " ��.��� 	 �@�FocusVisualStyle
 Z� �� 	 � ��
 �� " ��.R�� .+��� $ PART_ContentHost�����	#4CFFFFFF|�. $��Hidden=�$��Hidden=�.��� -    �Name$ 
LayoutRoot��$��0,0,9.991,-0.926q� � DataContext ��  �� Source# [  .+��� #���  $
��Left=�$	��388��$��
10,125,0,0q�$	��Top=�$	��632�����	#4CFFFFFF���� *	Employees+ �� SelectedItem �� *CurrentEmployee+ �� Mode$ TwoWay=��� $
��Left=�$��44��$��	22,10,0,0q�$
��Wrap=�$��	Employees��$	��Top=�$	��281��$��26(����	#FF17204A�� ���	#4CFFFFFF$
��Left=�$��33��$��
222,59,0,0q� �� TextWrapping$
 Wrap=�$	��Top=�$	��304��$��16(� �� TextAlignment$ Center=�#���  ���� *EmployeeFilter+ �� UpdateSourceTrigger$ PropertyChanged=��� $
��Left=�$��46��$��	22,59,0,0q�$
��Wrap=�$��Filter by Employee Name��$	��Top=�$	��146��$��14(�