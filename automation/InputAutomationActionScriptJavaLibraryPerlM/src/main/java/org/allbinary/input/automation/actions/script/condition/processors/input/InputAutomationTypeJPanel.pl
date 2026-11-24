#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::input::automation::actions::script::condition::processors::input::InputAutomationTypeJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{inputAutomationTypeJComboBox} = undef;
    $self->{jLabel1} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        $self->initComponents();
    return $self;
}


sub getInputAutomationTypeJComboBox {
    my ($self) = @_;
        return $self->{inputAutomationTypeJComboBox};
}


sub setInputAutomationTypeJComboBox {
    my ($self, $inputAutomationTypeJComboBox) = @_;
        $self->{inputAutomationTypeJComboBox} = $inputAutomationTypeJComboBox;
}


sub initComponents {
    my ($self) = @_;
        $self->{inputAutomationTypeJComboBox} = 'javax::swing::JComboBox'->new();
        $self->{jLabel1} = 'javax::swing::JLabel'->new();
        $self->{inputAutomationTypeJComboBox}->setModel('javax::swing::DefaultComboBoxModel'->new(["DirectX", "DirectX 8", "Low Level", "Java Robot"]));
        $self->{jLabel1}->setText("Input Type:");
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{jLabel1})->addPreferredGap($javax::swing::LayoutStyle::ComponentPlacement->{RELATED})->addComponent($self->{inputAutomationTypeJComboBox}, 0, 98, 32767)));
        $layout->setVerticalGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{LEADING})->addGroup($layout->createParallelGroup($javax::swing::GroupLayout::Alignment->{BASELINE})->addComponent($self->{jLabel1})->addComponent($self->{inputAutomationTypeJComboBox}, $javax::swing::GroupLayout::PREFERRED_SIZE, $javax::swing::GroupLayout::DEFAULT_SIZE, $javax::swing::GroupLayout::PREFERRED_SIZE)));
}

use java::lang::Object ();
# use javax::swing::DefaultComboBoxModel ();
# use javax::swing::GroupLayout ();
# use javax::swing::JComboBox ();
# use javax::swing::JLabel ();
# use javax::swing::JPanel ();
# use javax::swing::LayoutStyle ();

1;

