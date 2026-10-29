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

package org::allbinary::graphics::j2me::workarea::properties::PropertiesJPanel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel';


sub _init_fields {
    my ($self) = @_;
    $self->{rotateJButton} = undef;
    $self->{copyVerticalJButton} = undef;
    $self->{leftJButton} = undef;
    $self->{rotateJPanel} = undef;
    $self->{angleJTextField} = undef;
    $self->{workAreaPropertiesJPanel} = undef;
    $self->{modifierJPanel} = undef;
    $self->{upJButton} = undef;
    $self->{jPanel8} = undef;
    $self->{downJButton} = undef;
    $self->{jPanel7} = undef;
    $self->{rightJButton} = undef;
    $self->{copyHorizontalJButton} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->initComponents();
    return $self;
}


sub set {
    my ($self, $panel) = @_;
        $self->{workAreaPropertiesJPanel}->add($panel);
        $self->repaint();
}


sub initComponents {
    my ($self) = @_;
        $self->{workAreaPropertiesJPanel} = 'javax::swing::JPanel'->new();
        $self->{modifierJPanel} = 'javax::swing::JPanel'->new();
        $self->{copyVerticalJButton} = 'javax::swing::JButton'->new();
        $self->{copyHorizontalJButton} = 'javax::swing::JButton'->new();
        $self->{rotateJPanel} = 'javax::swing::JPanel'->new();
        $self->{rotateJButton} = 'javax::swing::JButton'->new();
        $self->{angleJTextField} = 'javax::swing::JTextField'->new();
        $self->{jPanel7} = 'javax::swing::JPanel'->new();
        $self->{upJButton} = 'javax::swing::JButton'->new();
        $self->{downJButton} = 'javax::swing::JButton'->new();
        $self->{jPanel8} = 'javax::swing::JPanel'->new();
        $self->{leftJButton} = 'javax::swing::JButton'->new();
        $self->{rightJButton} = 'javax::swing::JButton'->new();
        $self->setLayout('java::awt::GridLayout'->new(2, 1));
        $self->{workAreaPropertiesJPanel}->setLayout('java::awt::GridLayout'->new());
        $self->add($self->{workAreaPropertiesJPanel});
        $self->{modifierJPanel}->setLayout('java::awt::GridLayout'->new(6, 0));
        $self->{copyVerticalJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{copyVerticalJButton}->setText("Copy Vertical");
        $self->{modifierJPanel}->add($self->{copyVerticalJButton});
        $self->{copyHorizontalJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{copyHorizontalJButton}->setText("Copy Horizontal");
        $self->{modifierJPanel}->add($self->{copyHorizontalJButton});
        $self->{rotateJPanel}->setLayout('java::awt::GridLayout'->new(1, 2));
        $self->{rotateJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{rotateJButton}->setText("Rotate");
        $self->{rotateJPanel}->add($self->{rotateJButton});
        $self->{angleJTextField}->setText("Angle");
        $self->{rotateJPanel}->add($self->{angleJTextField});
        $self->{modifierJPanel}->add($self->{rotateJPanel});
        $self->{jPanel7}->setLayout('java::awt::GridLayout'->new(1, 2));
        $self->{upJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{upJButton}->setText("Up");
        $self->{jPanel7}->add($self->{upJButton});
        $self->{downJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{downJButton}->setText("Down");
        $self->{jPanel7}->add($self->{downJButton});
        $self->{modifierJPanel}->add($self->{jPanel7});
        $self->{jPanel8}->setLayout('java::awt::GridLayout'->new(1, 2));
        $self->{leftJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{leftJButton}->setText("Left");
        $self->{jPanel8}->add($self->{leftJButton});
        $self->{rightJButton}->setFont('java::awt::Font'->new("Dialog", 0, 10));
        $self->{rightJButton}->setText("Right");
        $self->{jPanel8}->add($self->{rightJButton});
        $self->{modifierJPanel}->add($self->{jPanel8});
        $self->add($self->{modifierJPanel});
}

# use javax::swing;

1;

