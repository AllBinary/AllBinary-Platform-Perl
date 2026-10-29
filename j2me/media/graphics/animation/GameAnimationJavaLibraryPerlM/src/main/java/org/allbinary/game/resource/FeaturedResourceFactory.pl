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

package org::allbinary::game::resource::FeaturedResourceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{ANIMATION_FEATURES} = "Animation Features: Vector: ";
    $self->{IMAGE_LABEL} = " Image: ";
    $self->{IMAGE_GRAPHICS_ARRAY} = "Image Array: ";
    $self->{IMAGE_GRAPHICS_ROTATION} = "Image Rotate: ";
    $self->{SPRITE_QUARTER} = " Sprite Quarter: ";
    $self->{SPRITE_FULL} = " Sprite Full: ";
    $self->{IS_LOADING_LEVEL_LABEL} = " isLoadingLevel ";
    $self->{IS_FEATURE} = " isFeature: ";
    $self->{GAME_FEATURE_CONTROLLED} = "GameFeatureControlledInterface: ";
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub init {
    my ($self, $level) = @_;
        my $size = $self->{list}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $featureInterface = $self->{list}->{objectArray}->[$index];
            my $isLoadingLevel = $featureInterface->isLoadingLevel($level);
            my $isFeature = $featureInterface->isFeature();
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{GAME_FEATURE_CONTROLLED})->append($featureInterface->toString())->append($self->{IS_LOADING_LEVEL_LABEL})->append('org::allbinary::game::resource::ResourceLoadingLevelFactory'->getInstance()->getLevelString($level))->append('org::allbinary::string::CommonSeps'->getInstance()->{COLON_SEP})->appendboolean($isLoadingLevel)->append($self->{IS_FEATURE})->appendboolean($isFeature)->toString(), $self, $self->{commonStrings}->{INIT});
            if ($isLoadingLevel && $isFeature) {
                $featureInterface->init($level);
            }
        }
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $graphicsFeatureFactory = 'org::allbinary::game::configuration::feature::GraphicsFeatureFactory'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{ANIMATION_FEATURES});
        $stringBuffer->appendboolean($features->isFeature($graphicsFeatureFactory->{VECTOR_GRAPHICS}));
        $stringBuffer->append($self->{IMAGE_LABEL});
        $stringBuffer->appendboolean($features->isFeature($graphicsFeatureFactory->{IMAGE_GRAPHICS}));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{INIT});
        if ($features->isFeature($graphicsFeatureFactory->{IMAGE_GRAPHICS})) {
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append($self->{IMAGE_GRAPHICS_ARRAY});
            $stringBuffer->appendboolean($features->isFeature($graphicsFeatureFactory->{IMAGE_TO_ARRAY_GRAPHICS}));
            $stringBuffer->append($self->{IMAGE_GRAPHICS_ROTATION});
            $stringBuffer->appendboolean($features->isFeature($graphicsFeatureFactory->{IMAGE_TO_ARRAY_GRAPHICS}));
            $stringBuffer->append($self->{SPRITE_QUARTER});
            $stringBuffer->appendboolean($features->isFeature($graphicsFeatureFactory->{SPRITE_QUARTER_ROTATION_GRAPHICS}));
            $stringBuffer->append($self->{SPRITE_FULL});
            $stringBuffer->appendboolean($features->isFeature($graphicsFeatureFactory->{SPRITE_FULL_GRAPHICS}));
            $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{INIT});
        }
}


sub clear {
    my ($self) = @_;
        $self->{list}->clear();
}


sub add {
    my ($self, $featureInterface) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($featureInterface))->toString(), $self, $self->{commonStrings}->{ADD});
        $self->{list}->add($featureInterface);
}


sub getList {
    my ($self) = @_;
        return $self->{list};
}

use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureControlledInterface;
use org::allbinary::game::configuration::feature::GraphicsFeatureFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::resource::ResourceLoadingLevelFactory;

1;

