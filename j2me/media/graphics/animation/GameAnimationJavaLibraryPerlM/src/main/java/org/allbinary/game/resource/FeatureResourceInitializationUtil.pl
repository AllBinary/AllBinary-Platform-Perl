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

package org::allbinary::game::resource::FeatureResourceInitializationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::resource::FeatureResourceInitializationUtil'->new();

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


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::resource::FeatureResourceInitializationUtil::instance;
}


# throws Exception
sub init {
    my ($self, $level) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{logUtil}->putF($commonStrings->{START}, $self, $commonStrings->{INIT});
        my $featuredResourceFactory = 'org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance();
        $featuredResourceFactory->init($level);
        'org::allbinary::game::resource::FeaturedResourceRelativeRelationshipFactory'->getInstance()->init($level);
}

use org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::resource::FeaturedResourceRelativeRelationshipFactory;

1;

