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
use parent -norequire,'javax::swing::JPanel';


sub _init_fields {
    my ($self) = @_;
    $self->{inputAutomationTypeJComboBox} = undef;
    $self->{jLabel1} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
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
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addComponent($self->{jLabel1})->addPreferredGap($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{LayoutStyle}->{ComponentPlacement}->{RELATED})->addComponent($self->{inputAutomationTypeJComboBox}, 0, 98, 32767)));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createParallelGroup($org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{Alignment}->{BASELINE})->addComponent($self->{jLabel1})->addComponent($self->{inputAutomationTypeJComboBox}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{DEFAULT_SIZE}, $org::allbinary::input::automation::actions::script::condition::processors::input::javax::swing->{GroupLayout}->{PREFERRED_SIZE})));
}


1;

