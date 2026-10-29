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

package org::allbinary::input::automation::module::configuration::BlankModuleConfigurationJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel';


sub _init_fields {
    my ($self) = @_;
    $self->{jLabel1} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->initComponents();
    return $self;
}


sub initComponents {
    my ($self) = @_;
        $self->{jLabel1} = 'javax::swing::JLabel'->new();
        $self->{jLabel1}->setText("No Configuration Available");
        my $layout = 'javax::swing::GroupLayout'->new($self);
        $self->setLayout($layout);
        $layout->setHorizontalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($org::allbinary::input::automation::module::configuration::javax::swing->{GroupLayout}->{Alignment}->{TRAILING}, $layout->createSequentialGroup()->addContainerGap(231, 32767)->addComponent($self->{jLabel1})->addGap(225, 225, 225)));
        $layout->setVerticalGroup($layout->createParallelGroup($org::allbinary::input::automation::module::configuration::javax::swing->{GroupLayout}->{Alignment}->{LEADING})->addGroup($layout->createSequentialGroup()->addContainerGap()->addComponent($self->{jLabel1})->addContainerGap(362, 32767)));
}


1;

