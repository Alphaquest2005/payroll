   M S B A M L   `   `   `  ���� \  XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089  �� MergedDictionaries �� Source �� 
TargetType   StandardTabControl �� 	Resources �� Property �� Value �� 
TargetType J� SnapsToDevicePixels � ColumnDefinitions	 � 	Resources  
Foreground
 F�Name  CloseButtonStroke �� StrokeStartLineCap �� StrokeEndLineCap �� Stretch �� Triggers ^� 
Conditions �� Binding �� RelativeSource �� Mode �� AncestorType �� Value P� Property P� Value $  CloseButtonBackgroundHighlighted �� 
TargetName   CloseButtonStrokeHighlighted   CloseButtonBackgroundPressed  BorderBrushSelected  BackgroundSelected-    'System.Windows.Input.KeyboardNavigation    TabNavigation � RowDefinitions K� ZIndex K� IsItemsHost    TabIndex  
Background�� D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     :x,http://schemas.microsoft.com/winfx/2006/xaml        �� $ Resources.xaml?�%J  &	        7  7  7  7  7  7  7  7  7  7  �� " �� ���� '��       " ��.���  �@�FocusVisualStyle Z� ��  � ��
 ���� ��  � �� �� " ��.R�� #��z�� . $��23�� �� $
��Auto ��� $��25 �.+��� $��Header��$��	10,0,10,0q�$��Center=�$��Center=�	 ���� '��       " ��.���  � ��8   �� $��1��$��15��$��15��$��Center=�$��Center=����� " ��.���  � ��
 ���� ��  �@�Cursor$
 Hand����  � |� .  ��  � �� �� " ��.R�� #��z��.+�F� $
 
ButtonPath��$��2q�+����        �@B @B �    @B �@B     	8�� $��2��$
 Flat=�$
 Flat=�$ Uniform=�$��Center=�$��Center=� ^�  ��  �� *
IsSelected+ �� $ FindAncestor=�$ TabItemL�	 false��  �� *IsMouseOver+ �� $ FindAncestor=�$ TabItemL�	 false0���  � y�$ Hidden=�P�  � {� .  . ���  � y�$ Hidden=�P�  �@J�IsMouseOver . . ��� 8   � ���� $ 
ButtonPath��8   � ��P�  � �� . . ��� 8   � ���� $ 
ButtonPath��8   � ���� $ 
ButtonPath�� � ��$ 2.5,2.5,1.5,1.5q� P�  �@��
IsSelected .  . ���  � ��
 ���� P�  �@J�IsMouseOver . . ��� 8   � ��P�  �@��
IsSelected . . ��� 8   � ��.���  � �� �� " ��.R�� $ Local=� �� $
��Auto ��� $��* �.+��� 
������ $��0,0,0,3q�8�� ._��� $��HeaderPanel��$ 1��$��0,0,4,-1q� . $ 1���� $��1��8��	 �� $��PART_SelectedContentHost��$��1��$��SelectedContent��