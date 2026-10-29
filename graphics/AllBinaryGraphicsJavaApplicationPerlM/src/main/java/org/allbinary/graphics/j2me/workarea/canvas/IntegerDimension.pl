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

package org::allbinary::graphics::j2me::workarea::canvas::IntegerDimension;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{width} = 0;
    $self->{height} = 0;
}


sub new {
    my ($class, $width, $height) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setWidth($width);
        $self->setHeight($height);
    return $self;
}


sub getWidth {
    my ($self) = @_;
        return $self->{width};
}


sub setWidth {
    my ($self, $width) = @_;
        $self->{width} = $width;
}


sub getHeight {
    my ($self) = @_;
        return $self->{height};
}


sub setHeight {
    my ($self, $height) = @_;
        $self->{height} = $height;
}


1;

