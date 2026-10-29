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

package org::allbinary::graphics::j2me::workarea::color::ColorChooser;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::swing::JPanel';


sub _init_fields {
    my ($self) = @_;
    $self->{jColorChooser1} = undef;
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
        $self->{jColorChooser1} = 'javax::swing::JColorChooser'->new();
        $self->setLayout('java::awt::BorderLayout'->new());
        $self->add($self->{jColorChooser1}, $org::allbinary::graphics::j2me::workarea::color::java::awt->{BorderLayout}->{CENTER});
}


1;

