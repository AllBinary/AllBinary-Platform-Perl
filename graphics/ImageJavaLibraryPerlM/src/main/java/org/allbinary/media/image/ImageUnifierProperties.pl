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

package org::allbinary::media::image::ImageUnifierProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{rows} = undef;
    $self->{columns} = undef;
    $self->{imageUnifierCell} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getWidth {
    my ($self) = @_;
        return int($self->getColumns()) * int($self->getImageUnifierCell()->getWidth());
}


sub getHeight {
    my ($self) = @_;
        return int($self->getRows()) * int($self->getImageUnifierCell()->getHeight());
}


sub getRows {
    my ($self) = @_;
        return $self->{rows};
}


sub setRows {
    my ($self, $rows) = @_;
        $self->{rows} = $rows;
}


sub getColumns {
    my ($self) = @_;
        return $self->{columns};
}


sub setColumns {
    my ($self, $columns) = @_;
        $self->{columns} = $columns;
}


sub getImageUnifierCell {
    my ($self) = @_;
        return $self->{imageUnifierCell};
}


sub setImageUnifierCell {
    my ($self, $imageUnifierCell) = @_;
        $self->{imageUnifierCell} = $imageUnifierCell;
}


1;

