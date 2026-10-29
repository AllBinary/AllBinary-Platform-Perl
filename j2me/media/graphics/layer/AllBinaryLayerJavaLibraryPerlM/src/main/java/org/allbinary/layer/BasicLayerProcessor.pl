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

package org::allbinary::layer::BasicLayerProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_LAYER_PROCESSOR = 'org::allbinary::layer::BasicLayerProcessor'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub add {
    my ($self, $layerInterface) = @_;
        if (!$self->{list}->contains($layerInterface)) {
            $self->{list}->add($layerInterface);
        }
}


# throws Exception
sub process {
    my ($self, $allBinaryLayerManager) = @_;
        die ('org::allbinary::string::CommonStrings'->getInstance()->{NOT_IMPLEMENTED});
}


sub getList {
    my ($self) = @_;
        return $self->{list};
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

