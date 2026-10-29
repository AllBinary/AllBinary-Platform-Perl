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

package org::allbinary::graphics::j2me::workarea::tools::Points;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::j2me::workarea::tools::PointsInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{pointVector} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{pointVector} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub init {
    my ($self) = @_;
        $self->{pointVector}->clear();
}


sub getPoints {
    my ($self) = @_;
        return $self->{pointVector};
}


sub addPoints {
    my ($self, $vector) = @_;
        $self->{pointVector}->addAll2($vector);
}


sub isValid {
    my ($self) = @_;
        if ($self->{pointVector}->size() > 1) {
            return 1;
        } else {
            return 0;
        }
}


sub getSize {
    my ($self) = @_;
        return $self->{pointVector}->size();
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::graphics::j2me::workarea::tools::PointsInterface;

1;

