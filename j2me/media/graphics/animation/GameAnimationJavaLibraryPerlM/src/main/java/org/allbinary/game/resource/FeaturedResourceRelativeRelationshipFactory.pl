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

package org::allbinary::game::resource::FeaturedResourceRelativeRelationshipFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::resource::FeaturedResourceFactory';

our $INSTANCE = 'org::allbinary::game::resource::FeaturedResourceRelativeRelationshipFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{basicArrayListUtil} = 'org::allbinary::util::BasicArrayListUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::resource::FeaturedResourceRelativeRelationshipFactory::INSTANCE;
}


# throws Exception
sub getRelativeRelationshipList {
    my ($self, $resource, $layer) = @_;
        my $featureReleaseList = $self->getList();
        my $size = $self->getList()->size();
        for (my $index = 0; $index < $size; $index++) {
            my $featureInterface = $featureReleaseList->{objectArray}->[$index];
            if ($featureInterface->isFeature()) {
                my $list = $featureInterface->getResourceRelativeRelationshipList($resource);
                if ($list != $self->{basicArrayListUtil}->getImmutableInstance()) {
                    return $self->duplicate($list, $layer);
                }
            }
        }
        die ('org::allbinary::logic::string::StringMaker'->new()->append("Not available for current feature selection or Resource: ")->append($resource)->toString());
}


# throws Exception
sub duplicate {
    my ($self, $list, $layer) = @_;
        my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
        my $newList = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            my $relativeRelationship = $list->{objectArray}->[$index];
            $newList->add('org::allbinary::layer::relationship::RelativeLayerRelationship'->new($layer, $pointFactory->createXY($relativeRelationship->getX(), $relativeRelationship->getY()), 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance()));
        }
        return $newList;
}

use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::RelativeRelationship;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::relationship::RelativeLayerRelationship;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::game::resource::FeaturedResourceFactory;

1;

