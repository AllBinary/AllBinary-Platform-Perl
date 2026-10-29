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

package org::allbinary::business::advertisement::thumbnail::AdvertisementThumbnail;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::advertisement::thumbnail::AdvertisementThumbnailInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{imageFileName} = undef;
    $self->{imageUrl} = undef;
    $self->{constraint} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getFileName {
    my ($self) = @_;
        return $self->{imageFileName};
}


sub getUrl {
    my ($self) = @_;
        return $self->{imageUrl};
}


sub getTwoDimensionalConstraint {
    my ($self) = @_;
        return $self->{constraint};
}

use org::allbinary::logic::control::contraints::size::TwoDimensionalConstraintInterface;
use org::allbinary::business::advertisement::thumbnail::AdvertisementThumbnailInterface;

1;

