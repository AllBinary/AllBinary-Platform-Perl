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

package org::allbinary::game::layer::resources::OnDemandResources;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_ON_DEMAND_RESOURCES = 'org::allbinary::game::layer::resources::OnDemandResources'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub waitFor {
    my ($self) = @_;
}


# throws Exception
sub init {
    my ($self) = @_;
}


# throws Exception
sub initAt {
    my ($self, $imageCache, $resourceAnimationInterfaceFactoryInterfaceFactory, $portion, $loadingString, $index) = @_;
        return 0;
}

use org::allbinary::animation::resource::BaseResourceAnimationInterfaceFactoryInterfaceFactory;
use org::allbinary::image::ImageCache;
use org::allbinary::logic::communication::log::LogUtil;

1;

