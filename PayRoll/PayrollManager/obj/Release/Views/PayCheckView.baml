   M S B A M L   `   `   `  ���� I  EPayrollManager, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:PayrollManagerPayrollManager  R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R8clr-namespace:System.ComponentModel;assembly=WindowsBaseSystem.ComponentModel E'clr-namespace:PayrollManager.ConvertersPayrollManager.Converters  !    PayrollManager.PayCheckView   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     .localclr-namespace:PayrollManager     Hscm8clr-namespace:System.ComponentModel;assembly=WindowsBase     >
converters'clr-namespace:PayrollManager.Converters     $��967.2��  � 	Resources  &    PayrollManager.PayCheckViewModel   PayCheckViewModelDataSource*   $PayrollManager.Converters.NumToWords  
NumToWords<   6PayrollManager.Converters.PayrollItemSubtotalConverter   PayrollItemSubtotalConverter8   2PayrollManager.Converters.BooleanToIncomeDeduction  BooleanToIncomeDeduction  CheckTemplate �� EndPoint �� 
StartPoint � Color � Offset �� Source J� RenderTransformOrigin �� ScaleY �� StringFormat	 �� 	Converter
 �� Orientation �� ScaleX �� CanVerticallyScroll  AccountEntryTemplate  ReportListBoxItemStyle  ReportListBox �� TextAlignment��%�  &	        &	      &	 
     &	      &	      7   7   7   7  &	 Q            �� .R�� $	��195��$��0q�$	��Top=�$��819.4������ $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFEAF7D5��� $ 	#FF97C450��$ 1Q�.+�� $��310.606,15.197,10,10q�.+��� $��0q�$
��Left=�$	��Top=�$��16(�$
��Bold"�$��177.6������ *CurrentBranch.Name+8   �� $��0,17.051,0,0q�$
��Left=�$	��Top=�$��16(�$��146.4������ *CurrentBranch.Address+8  �� $��0,34.102,0,0q�$
��Left=�$	��Top=�$��16(�$��146.4������ *CurrentBranch.PhoneNumber+8  �� $��82.046,76.809,0,0q�$
��Left=�$	��Top=�$��16(�$��312.8������ *Employee.DisplayName+�� $
��Left=�$��35.525��$��0,63.79,0,0q�$
��Wrap=�$	��Top=�$��66.335���� $�Pay To The ���� �� $�Order Of���� ���	#FFC4D7BF$
��Left=�$��1��$��2.619,103.77,0,0q�
���   �$	��Top=�$��357.644��$ 0.5,0.5&�z�V� .~��� $ -1Q��� �� T� �� $��388.794,76.907,0,0q�$
��Left=�$	��Top=�$	��112��$��18.667(����� *Total+$ c���� ���	#FFC4D7BF$
��Left=�$��1��$��388.124,104.424,0,0q�
���   �$	��Top=�$��103.866��$ 0.5,0.5&�z�V� .~��� $ -1Q��� �� T� �� $
��Left=�$��22.693��$��332.548,34.914,0,0q�$
��Wrap=�$	��Top=�$��232.246��$��16(����� *Date+�� $
��Left=�$��24.913��$��183.574,144.89,0,0q�$
��Wrap=�$	��Top=�$��152.119��$��14.667(����� *AccountNumber+�� $��3.712,111.285,0,0q�$
��Left=�$	��Top=�$��16(�$��461.379������ *Total+8	  �� ���	#FFC4D7BF$
��Left=�$��1��$��1.746,136.065,0,0q�
���   �$	��Top=�$��490.528��$ 0.5,0.5&�z�V� .~��� $ -1Q��� �� T� � $��10,10,539.4,2.5q�.+��� $��281.2,0.1,-20.8,2.4q�$
 Vertical=�$��Center=�$ 0.5,0.5&�z�V� .~��� $ -1Q��� �� T� .+��� 
���   �$��0,5,0,0q�$��1q�$
��Left=�$��15��$	��Top=�$��3��
���   ��� 
���   �$��0,5,0,0q�$��1q�$
��Left=�$��15��$	��Top=�$��3��
���   ��� 
���   �$��0,5,0,0q�$��1q�$
��Left=�$��15��$	��Top=�$��3��
���   ��� 
���   �$��0,5,0,0q�$��1q�$
��Left=�$��15��$	��Top=�$��3��
���   ��� 
���   �$��0,5,0,0q�$��1q�$
��Left=�$��15��$	��Top=�$��3��
���   ��� 
���   �$��0,5,0,0q�$��1q�$
��Left=�$��15��$	��Top=�$��3��
���   ��� 
���   �$��0,5,0,0q�$��1q�$
��Left=�$��15��$	��Top=�$��3��
���   ��� 
���   �$��0,5,0,0q�$��1q�$
��Left=�$��15��$	��Top=�$��3��
���   ��� 
���   �$��0,5,0,0q�$��1q�$
��Left=�$��15��$	��Top=�$��3��
���   ��� $��	5,2.5,0,0q�$
 Vertical=� . $
��Auto=���. $
��Left=�$	��255��.+��� $
��Left=�$��18.944��$��0q�$
��Wrap=�$��Cheque Stub��$	��Top=�$
��79.2��$
��Bold"��� $��Income�����	#FF4E6E06
�������$��19.16��$��
0,0,17.4,0q��� $
��Left=�$��61.456��$��0q�$	��Top=�$	��254��#���  #���  #���  ��Z� ���� *CreditEntries+�� $��
Deductions�����	#FFD29B32
�������$��19.16��$��
0,0,17.4,0q��� $
��Left=�$��56.854��$��0q�$	��Top=�$	��254��#���  #���  #���  ��Z� ���� *DebitEntries+�� .R�� $��19.201��$��214.314��.+��� $��148.724,1.678,0,0q�$
��Left=�$	��Top=�$��59.213��$
��Bold"�$ Right=����� *Total+$ c����Z� �� $��0,2,0,0q�$
��Left=�$	��Top=�$��139.287��$��15.638������ *PayrollItem.Name+�� 
�������$��1��$��0,38.16,-12,0q�$y�Hidden=�.��� -    �Name$ 
LayoutRoot�� � DataContext �� # [  .+��� $��0,82,140.2,10q�
������ #���  ���� *" CurrentEmployee.EmployeeAccounts+�� $
��Left=�$��37��$��	10,10,0,0q�$
��Wrap=�$��Cheque Preview��$	��Top=�$��340.6��$��26(��� -     TextButtonStyle#���  $
��Left=�$��30��$��
732,26,0,0q�$
��Wrap=�$��	Print ��$	��Top=�$��95��$��20(�$��Segoe UI Symbol)�