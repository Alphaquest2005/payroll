   M S B A M L   `   `   `  ����\  XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089  �� MergedDictionaries �� Source �� 
TargetType   StandardTabControl �� 	Resources �� Property �� Value �� 
TargetType J� SnapsToDevicePixels � ColumnDefinitions	 � 	Resources  
Foreground
 F�Name  CloseButtonStroke �� StrokeStartLineCap �� StrokeEndLineCap �� Stretch �� Triggers ^� 
Conditions �� Binding �� RelativeSource �� Mode �� AncestorType �� Value P� Property P� Value $  CloseButtonBackgroundHighlighted �� 
TargetName   CloseButtonStrokeHighlighted   CloseButtonBackgroundPressed  BorderBrushSelected  BackgroundSelected-    'System.Windows.Input.KeyboardNavigation    TabNavigation � RowDefinitions K� ZIndex K� IsItemsHost    TabIndex  
Background�� 5      D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     :x,http://schemas.microsoft.com/winfx/2006/xaml      5        5      �� 5   
   $ Resources.xaml?�6   %�
  &	        7  7  7  7  7  7  7  7  7  7  �� 5      " ��6    5   
   ���� 5      '��       " ��6   .�5	      ��  �@�FocusVisualStyle 65   Z� �� 5
       � ��
 ���� 6/   �� 5       � �� 5      �� 5      " ��6*   .R�5      � #��z��6#    . $��23��6h    5   "   �� 5   &   $
��Auto �67   �� 5   &   $��25 �67   .+�5   "   �� $��Header��63   $��	10,0,10,0q�6J   $��Center=�6]   $��Center=�6z   	 5   &   ���� 5   *   '��       " ��60   .�5   .   ��  � ��8   6K   5   +   5   '   5   #   �� 5   "   $��1��6)   $��15��69   $��15��6E   $��Center=�6P   $��Center=�6m   ��5   &   �� 5   *   " ��60   .�5   .   ��  � ��
 ���� 6K   �� 5   .    �@�Cursor$
 Hand��6G   �� 5   .    � |� .  6J   �� 5    .    � �� 5!   2   �� 5"   6   " ��6F   .R�5#   :   � #��z��6?   .+�5$   >   F� $
 
ButtonPath��6C   $��2q�5%   A   +����        �@B @B �    @B �@B     	8�� $��2��5(   A   $
 Flat=�5)   A   $
 Flat=�5*   A   $ Uniform=�5+   A   $��Center=�5,   A   $��Center=�5-   A   5.   ;    5/   :   ^� 50   >    51   B   �� 52   F    6P   �� *
IsSelected+ �� $ FindAncestor=�$ TabItemL�	 false6�   �� 53   F    6P   �� *IsMouseOver+ �� $ FindAncestor=�$ TabItemL�	 false6�   0�55   B   �� 56   F    � y�$ Hidden=�6c   58   ?   P� 59   >    � {� .  . �5:   B   ��  � y�$ Hidden=�6_   5;   ?   P� 5<   >    �@J�IsMouseOver . . �5=   B   �� 8   � ��6_   �� 5>   B   $ 
ButtonPath��6I   8   � ��6s   5?   ?   P� 5@   >    � �� . . �5A   B   �� 8   � ��6_   �� 5B   B   $ 
ButtonPath��6I   8   � ��6s   �� 5C   B   $ 
ButtonPath��6I    � ��$ 2.5,2.5,1.5,1.5q�6s   5D   ?   5F   7   5H   /   5I   +   5K   #   5L       5M      P� 5N   "    �@��
IsSelected .  . �5O   &   ��  � ��
 ���� 6C   5P   #   P� 5Q   "    �@J�IsMouseOver . . �5R   &   �� 8   � ��6C   5S   #   P� 5T   "    �@��
IsSelected . . �5U   &   �� 8   � ��6C   5V   #   5X      5Z      5[      5\      .�5]   
   ��  � �� 5^      �� 5_      " ��6"   .R�5`      � $ Local=�6    5a      �� 5b      $
��Auto �6,   �� 5c      $��* �6,   .+�5e      �� 
������ $��0,0,0,3q�6:   8�� ._�5g      �� $��HeaderPanel��6'   $ 1��6:   $��0,0,4,-1q�6K    . $ 1��5h   4   5i      �� 5j      $��1��6!   8��	 6.   �� 5k      $��PART_SelectedContentHost��68   $��1��6+   $��SelectedContent��5l   +   5m      5n      5p      5q      5r      