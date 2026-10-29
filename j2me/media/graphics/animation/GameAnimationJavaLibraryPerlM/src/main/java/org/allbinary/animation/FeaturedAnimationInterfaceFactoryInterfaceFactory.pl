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

package org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::game::resource::FeaturedResourceFactory';

our $INSTANCE = 'org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->new();


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory::INSTANCE;
}


# throws Exception
sub getRectangle {
    my ($self, $resource) = @_;
        return $self->getRectangleXY($resource, 0, 0);
}


# throws Exception
sub getRectangleXY {
    my ($self, $resource, $x, $y) = @_;
        my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
        my $list = $self->getList();
        my $scale = int('org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->{SCALE}->getValue());
        my $size = $self->getList()->size();
        for (my $index = 0; $index < $size; $index++) {
            my $featureInterface = $list->{objectArray}->[$index];
            if ($featureInterface->isFeature()) {
                my $rectangle = $featureInterface->getRectangle($resource);
                if ($rectangle != $org::allbinary::graphics::RectangleFactory::SINGLETON) {
                    return 'org::allbinary::graphics::Rectangle'->new($pointFactory->createXY($x, $y), (POSIX::floor((($rectangle->getWidth() * $scale)) / (2 ** (1)))), (POSIX::floor((($rectangle->getHeight() * $scale)) / (2 ** (1)))));
                }
            }
        }
        die ('org::allbinary::logic::string::StringMaker'->new()->append("No rectangle available for current feature selection or Resource: ")->append($resource)->toString());
}


# throws Exception
sub getProcedural {
    my ($self, $resource) = @_;
        return $self->getBasicAnimationInterfaceFactoryInstance($resource);
}


# throws Exception
sub get {
    my ($self, $resource) = @_;
        return $self->getBasicAnimationInterfaceFactoryInstance($resource);
}


# throws Exception
sub getBasicAnimationInterfaceFactoryInstance {
    my ($self, $resource) = @_;
        my $list = $self->getList();
        my $resourceTypeAvailableList = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $self->getList()->size();
        my $featureInterface = undef;
        my $animationInterfaceFactoryInterface = undef;
        for (my $index = 0; $index < $size; $index++) {
            $featureInterface = $list->{objectArray}->[$index];
            if ($featureInterface->isFeature()) {
                $resourceTypeAvailableList->add($featureInterface);
                $animationInterfaceFactoryInterface = $featureInterface->getBasicAnimationInterfaceFactoryInstance($resource);
                if ($animationInterfaceFactoryInterface != $org::allbinary::animation::NullAnimationFactory::NULL_NOT_FOR_USE_ANIMATION_FACTORY) {
                    return $animationInterfaceFactoryInterface;
                }
            }
        }
        if ($resourceTypeAvailableList->size() > 0) {
            my $NO_ANIMATION_AVAILABLE_FROM = "No animation available from: ";
            my $FOR_FACTORIES = " factories: ";
            my $FOR_RESOURCE = " for Resource: ";
            my $HAS_KEY = " has: ";
            my $RESOURCES_LABEL = " resources ";
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($NO_ANIMATION_AVAILABLE_FROM);
            $stringBuffer->appendint($resourceTypeAvailableList->size());
            $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{FORWARD_SLASH});
            $stringBuffer->appendint($size);
            $stringBuffer->append($FOR_FACTORIES);
            my $size2 = $resourceTypeAvailableList->size();
            for (my $index = 0; $index < $size2; $index++) {
                $stringBuffer->append($resourceTypeAvailableList->get($index)->toString());
                $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{COMMA_SEP});
            }
            $stringBuffer->append($FOR_RESOURCE);
            $stringBuffer->append($resource);
            for (my $index = 0; $index < $size; $index++) {
                $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
                $featureInterface = $list->{objectArray}->[$index];
                if ($featureInterface->isFeature()) {
                    $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($featureInterface));
                    $stringBuffer->append($HAS_KEY);
                    $stringBuffer->appendint($featureInterface->getHashtable()->size());
                    $stringBuffer->append($RESOURCES_LABEL);
                }
            }
            die ($stringBuffer->toString());
        } else {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            for (my $index = 0; $index < $size; $index++) {
                $featureInterface = $list->{objectArray}->[$index];
                $stringBuffer->append($featureInterface->toString());
                $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
            }
            my $result = $stringBuffer->toString();
            $stringBuffer->delete(0, $stringBuffer->length());
            die ($stringBuffer->append("No feature resource type available for Resource: ")->append($resource)->append(" Resource Factories Available: ")->append($result)->toString());
        }
}

use org::allbinary::animation::resource::FeatureResourceAnimationInterfaceFactoryInterface;
use org::allbinary::game::configuration::GameConfigurationCentral;
use org::allbinary::game::resource::FeaturedResourceFactory;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::RectangleFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::animation::NullAnimationFactory;

1;

