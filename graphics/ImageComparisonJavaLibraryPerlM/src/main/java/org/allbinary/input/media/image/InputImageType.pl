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

package org::allbinary::input::media::image::InputImageType;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
our $TYPE_VECTOR = 'org::allbinary::util::BasicArrayListD'->new();
our $CAPTURE = 'org::allbinary::input::media::image::InputImageType'->new("Capture", 0);
our $COMPARISON = 'org::allbinary::input::media::image::InputImageType'->new("Comparison", 1);
our $MOTION = 'org::allbinary::input::media::image::InputImageType'->new("Motion", 2);

sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{index} = undef;
}


sub new {
    my ($class, $name, $index) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        $self->{index} = $index;
        $org::allbinary::input::media::image::InputImageType::TYPE_VECTOR->add($self);
        $org::allbinary::input::media::image::InputImageType::hashMap->put($self->getName(), $self);
    return $self;
}


sub toString {
    my ($self) = @_;
        return "ImageType: " . $self->getName();
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getInstance {
    my ($class, $imageTypeString) = @_;
        return $org::allbinary::input::media::image::InputImageType::hashMap->get($imageTypeString);
}


sub getAllAsVector {
    my ($class) = @_;
        return $org::allbinary::input::media::image::InputImageType::TYPE_VECTOR;
}


sub getIndex {
    my ($self) = @_;
        return $self->{index};
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;

1;

