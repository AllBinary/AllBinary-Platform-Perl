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

package org::allbinary::game::layer::resources::GameGraphicsResourceUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{SPRITE} = "_sprite";
    $self->{QUARTER} = "_quarter";
    $self->{name} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::layer::resources::GameGraphicsResourceUtil::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::layer::resources::GameGraphicsResourceUtil::instance = 'org::allbinary::game::layer::resources::GameGraphicsResourceUtil'->new();
        }
        return $org::allbinary::game::layer::resources::GameGraphicsResourceUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        try {
            $self->{name} = $self->getString();
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{CONSTRUCTOR}, $e);
        }
    return $self;
}


# throws Exception
sub getString {
    my ($self) = @_;
        my $graphicsFeatureFactory = 'org::allbinary::game::configuration::feature::GraphicsFeatureFactory'->getInstance();
        my $graphicsFeature = $graphicsFeatureFactory->{NONE};
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ($features->isFeature($graphicsFeatureFactory->{IMAGE_TO_ARRAY_GRAPHICS})) {
            $graphicsFeature = $graphicsFeatureFactory->{IMAGE_TO_ARRAY_GRAPHICS};
        } elsif ($features->isFeature($graphicsFeatureFactory->{SPRITE_FULL_GRAPHICS})) {
            $graphicsFeature = $graphicsFeatureFactory->{SPRITE_FULL_GRAPHICS};
        } elsif ($features->isFeature($graphicsFeatureFactory->{SPRITE_QUARTER_ROTATION_GRAPHICS})) {
            $graphicsFeature = $graphicsFeatureFactory->{SPRITE_QUARTER_ROTATION_GRAPHICS};
        } elsif ($features->isFeature($graphicsFeatureFactory->{IMAGE_ROTATION_ON_THE_FLY})) {
            $graphicsFeature = $graphicsFeatureFactory->{IMAGE_ROTATION_ON_THE_FLY};
        }
        return $self->getStringForFeature($graphicsFeature);
}


# throws Exception
sub getStringForFeature {
    my ($self, $graphicsFeature) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $graphicsFeatureFactory = 'org::allbinary::game::configuration::feature::GraphicsFeatureFactory'->getInstance();
        $stringBuffer->delete(0, $stringBuffer->length());
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ($features->isFeature($graphicsFeatureFactory->{VECTOR_GRAPHICS})) {
        } elsif ($features->isFeature($graphicsFeatureFactory->{IMAGE_GRAPHICS})) {
            if ($graphicsFeature == $graphicsFeatureFactory->{IMAGE_TO_ARRAY_GRAPHICS} || $graphicsFeature == $graphicsFeatureFactory->{IMAGE_ROTATION_ON_THE_FLY}) {
            } elsif ($graphicsFeature == $graphicsFeatureFactory->{SPRITE_FULL_GRAPHICS}) {
                $stringBuffer->append($self->{SPRITE});
            } elsif ($graphicsFeature == $graphicsFeatureFactory->{SPRITE_QUARTER_ROTATION_GRAPHICS}) {
                $stringBuffer->append($self->{QUARTER});
                $stringBuffer->append($self->{SPRITE});
            } else {
                die ("None/Unknown Sub Image Resource Type Specified");
            }
        } elsif ('org::allbinary::graphics::opengles::OpenGLFeatureUtil'->getInstance()->isAnyThreed()) {
            $stringBuffer->append('org::allbinary::graphics::displayable::CanvasStrings'->getInstance()->{OBJ_MODEL});
        } else {
            die ("None/Unknown Main Image Resource Type Specified");
        }
        return $stringBuffer->toString();
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}

use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GraphicsFeature;
use org::allbinary::game::configuration::feature::GraphicsFeatureFactory;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::graphics::opengles::OpenGLFeatureUtil;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;

1;

