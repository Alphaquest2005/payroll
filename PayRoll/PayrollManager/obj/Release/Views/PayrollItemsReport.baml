   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  E'clr-namespace:PayrollManager.ConvertersPayrollManager.Converters  R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R8clr-namespace:System.ComponentModel;assembly=WindowsBaseSystem.ComponentModel '    !PayrollManager.PayrollItemsReport   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager     >
Converters'clr-namespace:PayrollManager.Converters     SComponentModel8clr-namespace:System.ComponentModel;assembly=WindowsBase       � 	Resources  ,   &PayrollManager.PayrollItemsReportModel %  !PayrollItemsReportModelDataSource8   2PayrollManager.Converters.BooleanToIncomeDeduction  BooleanToIncomeDeduction<   6PayrollManager.Converters.PayrollItemSubtotalConverter   PayrollItemSubtotalConverter   booleanToVisibilityConverter  cvs �� Source �� IsAsync �� Source �� SortDescriptions+  %System.ComponentModel.SortDescription   PropertyName   	Direction �� GroupDescriptions2  ,System.Windows.Data.PropertyGroupDescription   PropertyName��%�   &	        &	      &	 
     &	      &	      7         �� ��  �� *PayrollItems+ . 8      $ Priority��$ 	Ascending=�  $ PayrollItemName��  $ Amount��   $ PayrollItemName��.��� -   	 �Name$	 
LayoutRoot��
 � DataContext
 �� # [  .+��� -    ��Name$ 	ReportBRD��$��24,41,24.4,0q�$	��867��._��� -    ��Name$ 	ReportGrd��$��0,0,0,10q�.��� -   $	 DailyReportGD��$��Center=�$
��Auto��$	��Top=�$
��Auto��
�������
 �� .+�� $
��Left=�$��38��$��	40,97,0,0q�$	��Top=�$	��734�����	#FFD7D7D7.+��� $��	322,2,0,0q� �� TextAlignment$ Right=�$
��Left=�$	��Top=�$	��412��$��36��$��21.333(����	#FF353623���� *PayrollJobTotal+ �� StringFormat$ Gross Payroll Job {0:c}���� $��Center=�$
��31.8��$��460,65.2,42,0q�$
��Wrap=�$��Payroll Job Summary��$	��Top=�$	��314��$��25(�$ Right=�
���   �
��������� $��
546,13,0,0q�$
��Left=�$	��Top=�$��14.667(�
���   �$	��228��$ Right=����� *Date+�� $��40,140,42,40q� �� Orientation$ Vertical=�.+��� $
��Left=�$��24��$
��Wrap=�$	��Top=�$	��237��$��	0,15,0,15q�$��20(����	#FF393939$
 Left=�$��Payroll Item Summary���� $	��3.5q�$��0,0,0,0q����	#4DFFFFFF  ReportListBox#���     �� Color��%�   (��       * SystemColors.HighlightBrushKey+)(��      *SystemColors.ControlBrushKey+)(�� *     *$"SystemColors.HighlightTextBrushKey+)�� $ 	BurlyWood���� $ 	#FFD5D5D5���� # Z������ # [  �� 
GroupStyle (  "System.Windows.Controls.GroupStyle     ContainerStyle ��  �� 
TargetType" ��.���  �� Property � �� �� Value ��  �� 
TargetType" ��.R��  � RowDefinitions �� �� .+�� $	 gridTemplate��
���   �$��26��$��Center=�  ��%_   '��       �� " ��.���  � ��$ 14(���  � ��
 �������  � ��$ Center=� � ColumnDefinitions �� $
��Auto ��� $��* ��� $��45 ��� $��30 ��� $	��110 �.+�d�  d�Name$ btnShowHide�� d� 	IsChecked$
 TrueY�$	��3.5q�$y�Hidden=��� $��1��$��3.5,0q�$��16(����� *Name+�� $��2��$��Count:���� $��3��$ Right=�$��0,0,11,0q����� *	ItemCount+�� $��4��$ Right=�$��0,0,15,0q�$��16(�$
��Bold"�����  �� 	Converter# [ $ {0:C}���� $��1��$��
11,0,0,3.5q�y��� *	IsChecked+# [  �� ElementName$ btnShowHide�� �� Triggers ��  �� Value$
 True�� �� Binding �� *IsBottomLevel+.a���   �� 
TargetName$  gridTemplate�� � �� �	#FFEBEAE9���� .R�� $��30��.+��� $��Right=�! J� RenderTransformOrigin$! 0.5,0.5&�$��102.4��$��	0,0,175,0q�$��16(�$ Right=����� *Amount+$ C����Z� �� $
��Auto��$	��500��$��
10,0,198,0q�$��16(����� *InstitionName+�� $
��Left=�$
��29.6��$��37.3,13.4,0,0q�$
��Wrap=�$	��Top=�$��243.2��$��24(����� *Institution1.Name+�� $
��Left=�$��20��$��37.3,48,0,0q�$
��Wrap=�$	��Top=�$��243.2��$��16(����� *AccountName+�� $
��Left=�$��24��$��	40,73,0,0q�$
��Wrap=�$	��Top=�$	��321��$��16(�$
��Bold"����� *CurrentPayrollJob.Name+�� -     TextButtonStyle#���  $
��Left=�$��30��$��	810,6,0,0q�$
��Wrap=�$��	Print ��$	��Top=�$��95��$��20(�$��Segoe UI Symbol)�