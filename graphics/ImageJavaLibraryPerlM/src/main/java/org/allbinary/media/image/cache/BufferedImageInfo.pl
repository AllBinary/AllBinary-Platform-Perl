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

package org::allbinary::media::image::cache::BufferedImageInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{width} = undef;
    $self->{height} = undef;
    $self->{type} = undef;
}


sub new {
    my ($class, $width, $height, $type) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{width} = $width;
        $self->{height} = $height;
        $self->{type} = $type;
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


sub getType {
    my ($self) = @_;
        return $self->{type};
}


sub setType {
    my ($self, $type) = @_;
        $self->{type} = $type;
}


sub toString {
    my ($self) = @_;
        my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("BufferedImageInfo -");
        $stringBuffer->append($commonLabels->{WIDTH_LABEL});
        $stringBuffer->appendint($self->getWidth());
        $stringBuffer->append($commonLabels->{HEIGHT_LABEL});
        $stringBuffer->appendint($self->getHeight());
        $stringBuffer->append(" Type: ");
        $stringBuffer->appendint($self->getType());
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;

1;

