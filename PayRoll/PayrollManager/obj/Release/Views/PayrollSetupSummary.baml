   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  L HCustomWPFControls, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullbCclr-namespace:CustomWPFControls.DragDrop;assembly=CustomWPFControlsCustomWPFControls.DragDrop E'clr-namespace:PayrollManager.ConvertersPayrollManager.Converters  R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R8clr-namespace:System.ComponentModel;assembly=WindowsBaseSystem.ComponentModel (    "PayrollManager.PayrollSetupSummary   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager     XdragdropCclr-namespace:CustomWPFControls.DragDrop;assembly=CustomWPFControls     >
Converters'clr-namespace:PayrollManager.Converters     SComponentModel8clr-namespace:System.ComponentModel;assembly=WindowsBase       � 	Resources  -   'PayrollManager.PayrollSetupSummaryModel &  "PayrollSetupSummaryModelDataSource;   5PayrollManager.Converters.EnumMatchToBooleanConverter  EnumConverter8   2PayrollManager.Converters.BooleanToIncomeDeduction  BooleanToIncomeDeduction<   6PayrollManager.Converters.PayrollItemSubtotalConverter   PayrollItemSubtotalConverter   booleanToVisibilityConverter  ItmTemplate J� 	AllowDrop J� RenderTransformOrigin �� TextAlignment �� UpdateSourceTrigger  cvs �� Source �� Source �� SortDescriptions+  %System.ComponentModel.SortDescription   PropertyName	   	Direction
 �� GroupDescriptions2  ,System.Windows.Data.PropertyGroupDescription   PropertyName��%n  &	        &	      &	 
     &	      &	      &	      &	 �    7           �� �� .R�� $��54.62�� . .+��� $��Right=�$ 0.5,0.5&�$��102.4��$��
0,0,0,16.8q�$��24(�$ Right=����� *DisplayValue+�� $
��Auto��$
��Auto��$��88,0,120,24.8q�$��18.667(����� *Name+�� $
��Auto��$
��Auto��$��10,10,421.52,14.62q�$��18.667(����� *
Priority+$ PropertyChanged=��� $��88,34.82,0,0q�$
��Left=�$	��Top=�$��131.373������ *Account.Institution.Name+�� $��293,34,-0.48,0q�$
��Left=�$	��Top=�$	��186��$��20������ *Account.AccountNumber+�� $
��Left=�$��16.54��$��239.9,33.9,0,0q�$
��Wrap=�$��Acct#:��$	��Top=�$
��47.8����  �� *PayrollSetupItemsList+8      $ IncomeDeduction��$	 
Descending=�  $
 Name��  $ Amount��
   $ IncomeDeduction��.��� -    �Name$ 
LayoutRoot�� � DataContext �� # [  .+��� -    ��Name$ ItemsLst��$	��3.5q�$��	0,133,0,0q����	#4DFFFFFF#���  /  )CustomWPFControls.DragDrop.DragDropHelper   IsDragSource .    IsDropTarget .    DragDropTemplate# [  �� AlternationCount$ 10�� �� SelectionMode$ Multiple=����� *
DataSource+ �� SelectedItem �� *CurrentPayrollSetupItem+ �� Mode$ OneWayToSource=�   �� Color��%�   (��       * SystemColors.HighlightBrushKey+)(��      *SystemColors.ControlBrushKey+)(�� *     *$"SystemColors.HighlightTextBrushKey+)�� $ 	BurlyWood���� $ 	Chocolate���� # Z�� �� 
GroupStyle (  "System.Windows.Controls.GroupStyle     ContainerStyle ��  �� 
TargetType" ��.���  �� Property � �� �� Value ��  �� 
TargetType" ��.R��  � RowDefinitions �� �� .+�� $ gridTemplate��
���   �$��26��$��Center=�  ��%_   '��       �� " ��.���  � ��$ 14(���  � ��
 �������  � ��$ Center=� � ColumnDefinitions �� $
��Auto ��� $��* ��� $��45 ��� $��30 ��� $	��110 �.+�d�  d�Name$ btnShowHide��  d� 	IsChecked$
  TrueY�$	��3.5q��� $��1��$��3.5,0q����� *Name+! �� 	Converter#! [ �� $��2��$��Count:���� $��3��$ Right=�$��0,0,11,0q����� *	ItemCount+�� $��1��$��
11,0,0,3.5q�y��� *	IsChecked+#! [ " �� ElementName$" btnShowHide��# �� Triggers# �� $ �� Value$
$ True��% �� Binding% �� *IsBottomLevel+.a��� & �� 
TargetName$& gridTemplate�� � �� �	#FF965F00�� $
��Left=�$��35��$��	28,10,0,0q�$
��Wrap=�$��Payroll Setup Item List��$	��Top=�$	��277��$��24(��� ' �� DisplayMemberPath$
' Name��( �� SelectedValuePath$( PayrollJobTypeId��$��
191,51,0,0q�$
��Left=�$	��Top=�$��39��$	��242��$��16(�) �� SelectedValue) �� *PayrollJobTypeId+ �� *CurrentPayrollJobType+���� *PayrollJobTypes+�� $
��Left=�$��39��$��	10,51,0,0q�$
��Wrap=�$.��(Select Payroll Job Type to Auto Generate��$	��Top=�$	��176��$��14(�	� * 	� 	GroupName$* ItemType��$��
544,81,0,0q�$
��Left=�$	��Top=�$��21��$��74��$
��Sort��  �� *SortReorder++ �� ConverterParameter$
+ True��#! [ $ TwoWay=�$ PropertyChanged=�	� $* ItemType��$��
544,55,0,0q�$
��Left=�$	��Top=�$��21��$��74��$��Reorder��  �� *SortReorder+$+ False��#! [ $ TwoWay=�$ PropertyChanged=��� -   , ��Name$, 
AutoGenTxt��$
��Left=�$��19��$��269,107,0,0q�$
��Wrap=�$"��Auto Generate All Employees ��$	��Top=�$	��164��  TextButtonStyle#���  �� -   - ��Name$- MultiSelectChk��$
��Left=�$��19��$��544,107,0,0q�$	��Top=�$��86��$��Multi Select��