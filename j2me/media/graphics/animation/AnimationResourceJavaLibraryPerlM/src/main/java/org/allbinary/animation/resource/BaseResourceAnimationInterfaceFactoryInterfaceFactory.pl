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

package org::allbinary::animation::resource::BaseResourceAnimationInterfaceFactoryInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::resource::FeatureResourceAnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{hashtable} = undef;
    $self->{rectangleHashtable} = undef;
    $self->{rectangleArrayOfArraysHashtable} = undef;
    $self->{name} = undef;
    $self->{initialized} = 0;
}


sub new {
    my ($class, $name, $hashtable, $rectangleHashtable, $rectangleArrayHashtable) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{hashtable} = $hashtable;
        $self->{rectangleHashtable} = $rectangleHashtable;
        $self->{rectangleArrayOfArraysHashtable} = $rectangleArrayHashtable;
        $self->{name} = $name;
    return $self;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


# throws Exception
sub init {
    my ($self, $level) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Available List of Animations: ")->append($self->{hashtable}->toString())->toString(), $self, $commonStrings->{INIT});
        $self->setInitialized(1);
}


# throws Exception
sub initImageCache {
    my ($self, $imageCache, $level) = @_;
}


# throws Exception
sub add {
    my ($self, $resource, $animationInterfaceFactoryInterface) = @_;
        if ($self->{hashtable}->containsKey($resource)) {
            die ('org::allbinary::logic::string::StringMaker'->new()->append("Resource Already Created: ")->append($resource)->toString());
        }
        $self->{hashtable}->put($resource, $animationInterfaceFactoryInterface);
}


# throws Exception
sub getBasicAnimationInterfaceFactoryInstance {
    my ($self, $resource) = @_;
        my $basicAnimationInterfaceFactoryInterfaceCanBeNull = $self->{hashtable}->get($resource);
        if (!defined($basicAnimationInterfaceFactoryInterfaceCanBeNull)) {
            return $org::allbinary::animation::NullAnimationFactory::NULL_NOT_FOR_USE_ANIMATION_FACTORY;
        }
        return $basicAnimationInterfaceFactoryInterfaceCanBeNull;
}


# throws Exception
sub getRectangle {
    my ($self, $resource) = @_;
        my $rectangleCanBeNull = $self->{rectangleHashtable}->get($resource);
        if (!defined($rectangleCanBeNull)) {
            return $org::allbinary::graphics::RectangleFactory::SINGLETON;
        }
        return $rectangleCanBeNull;
}


# throws Exception
sub addRectangle {
    my ($self, $resource, $rectangle) = @_;
        $self->{rectangleHashtable}->put($resource, $rectangle);
}


# throws Exception
sub getRectangleArrayOfArrays {
    my ($self, $resource) = @_;
        return $self->{rectangleArrayOfArraysHashtable}->get($resource);
}


# throws Exception
sub addRectangleArrayOfArrays {
    my ($self, $resource, $rectangleArrayOfArrays) = @_;
        $self->{rectangleArrayOfArraysHashtable}->put($resource, $rectangleArrayOfArrays);
}


sub isFeature {
    my ($self) = @_;
        return 0;
}


sub isLoadingLevel {
    my ($self, $level) = @_;
        my $resourceLoadingLevelFactory = 'org::allbinary::game::resource::ResourceLoadingLevelFactory'->getInstance();
        if ($level == $resourceLoadingLevelFactory->{LOAD_ALL}->getLevel()) {
            return 1;
        } else {
            return 0;
        }
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append(ref($self))->append('org::allbinary::string::CommonSeps'->getInstance()->{SEMICOLON})->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($self->{name})->toString();
}


sub getHashtable {
    my ($self) = @_;
        return $self->{hashtable};
}


sub getRectangleHashtable {
    my ($self) = @_;
        return $self->{rectangleHashtable};
}


sub getRectangleArrayOfArraysHashtable {
    my ($self) = @_;
        return $self->{rectangleArrayOfArraysHashtable};
}


sub setInitialized {
    my ($self, $initialized) = @_;
        $self->{initialized} = $initialized;
}


sub isInitialized {
    my ($self) = @_;
        return $self->{initialized};
}

use org::allbinary::animation::BasicAnimationInterfaceFactoryInterface;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::game::resource::ResourceLoadingLevelFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::RectangleFactory;
use org::allbinary::image::ImageCache;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::animation::resource::FeatureResourceAnimationInterfaceFactoryInterface;

1;

