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

package org::allbinary::graphics::opengles::OpenGLConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{opengl} = 0;
    $self->{type} = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL_AS_GAME_THREAD};
    $self->{imageColor} = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{IMAGE_COLOR_DEPTH_4444};
    $self->{color} = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{IMAGE_COLOR_DEPTH_4444};
    $self->{versionSelector} = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL_AUTO_SELECT};
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::graphics::opengles::OpenGLConfiguration::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::graphics::opengles::OpenGLConfiguration::instance = 'org::allbinary::graphics::opengles::OpenGLConfiguration'->new();
        }
        return $org::allbinary::graphics::opengles::OpenGLConfiguration::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub write {
    my ($self) = @_;
}


# throws Exception
sub init {
    my ($self) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ('org::allbinary::game::configuration::event::ChangedGameFeatureListener'->getInstance()->isChangedFeature('org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance()->{STATIC})) {
            if ($self->isOpenGL()) {
                if (!$features->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL})) {
                    $self->{logUtil}->putF("Turning on OpenGL", $self, $self->{commonStrings}->{INIT});
                    $features->addDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL});
                    $self->{logUtil}->putF("Using OpenGL Type Feature: " . $self->getType(), $self, $self->{commonStrings}->{INIT});
                    $features->addDefault($self->getType());
                    $self->{logUtil}->putF("Using OpenGL ImageColor Feature: " . $self->getImageColor(), $self, $self->{commonStrings}->{INIT});
                    $features->addDefault($self->getImageColor());
                    $self->{logUtil}->putF("Using OpenGL Color Feature: " . $self->getColor(), $self, $self->{commonStrings}->{INIT});
                    $features->addDefault($self->getColor());
                    $self->{logUtil}->putF("Using OpenGL Version Selector Feature: " . $self->getVersionSelector(), $self, $self->{commonStrings}->{INIT});
                    $features->addDefault($self->getVersionSelector());
                }
            } else {
                $self->{logUtil}->putF("OpenGL is Off", $self, $self->{commonStrings}->{INIT});
            }
        } else {
            if ($self->isOpenGL() && !$features->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put("OpenGL is set but not Enabled since Statics where not cleared (Reboot or Complete exit is Required)", $self, $self->{commonStrings}->{INIT});
            }
        }
        'org::allbinary::logic::communication::log::PreLogUtil'->put($self->toString(), $self, $self->{commonStrings}->{INIT});
}


# throws Exception
sub update {
    my ($self, $gameFeature, $colorLocked) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $openGLFeatureFactory = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance();
        my $modified = 0;
        if ($gameFeature == $openGLFeatureFactory->{OPENGL}) {
            if ($features->isFeature($gameFeature)) {
                if (!$self->isOpenGL()) {
                    $self->setOpenGL(1);
                    $modified = 1;
                }
            } else {
                if ($self->isOpenGL()) {
                    $self->setOpenGL(0);
                    $modified = 1;
                }
            }
        }
        if ($gameFeature == $openGLFeatureFactory->{OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS} || $gameFeature == $openGLFeatureFactory->{OPENGL_AS_GAME_THREAD}) {
            if ($features->isFeature($gameFeature)) {
                if ($gameFeature != $self->getType()) {
                    $self->setType($gameFeature);
                    $modified = 1;
                }
            }
        }
        if ($gameFeature == $openGLFeatureFactory->{IMAGE_COLOR_DEPTH_4444} || $gameFeature == $openGLFeatureFactory->{IMAGE_COLOR_DEPTH_565} || $gameFeature == $openGLFeatureFactory->{IMAGE_COLOR_DEPTH_8888}) {
            if ($features->isFeature($gameFeature)) {
                if ($self->getImageColor() != $gameFeature) {
                    $self->setImageColor($gameFeature);
                    if ($colorLocked) {
                        if ($gameFeature == $openGLFeatureFactory->{IMAGE_COLOR_DEPTH_4444}) {
                            $self->setColor($openGLFeatureFactory->{OPENGL_COLOR_DEPTH_4444});
                        } elsif ($gameFeature == $openGLFeatureFactory->{IMAGE_COLOR_DEPTH_565}) {
                            $self->setColor($openGLFeatureFactory->{OPENGL_COLOR_DEPTH_565});
                        } elsif ($gameFeature == $openGLFeatureFactory->{IMAGE_COLOR_DEPTH_8888}) {
                            $self->setColor($openGLFeatureFactory->{OPENGL_COLOR_DEPTH_8888});
                        }
                    }
                    $modified = 1;
                }
            }
        }
        if ($gameFeature == $openGLFeatureFactory->{OPENGL_COLOR_DEPTH_4444} || $gameFeature == $openGLFeatureFactory->{OPENGL_COLOR_DEPTH_565} || $gameFeature == $openGLFeatureFactory->{OPENGL_COLOR_DEPTH_8888}) {
            if ($features->isFeature($gameFeature)) {
                if ($self->getColor() != $gameFeature) {
                    $self->setColor($gameFeature);
                    $modified = 1;
                }
            }
        }
        if ($gameFeature == $openGLFeatureFactory->{OPENGL_AUTO_SELECT} || $gameFeature == $openGLFeatureFactory->{OPENGL_MINIMUM}) {
            if ($features->isFeature($gameFeature)) {
                $self->setVersionSelector($gameFeature);
            }
            $modified = 1;
        }
}


sub setOpenGL {
    my ($self, $opengl) = @_;
        $self->{opengl} = $opengl;
}


sub isOpenGL {
    my ($self) = @_;
        return $self->{opengl};
}


sub setImageColor {
    my ($self, $imageColor) = @_;
        $self->{imageColor} = $imageColor;
}


sub getImageColor {
    my ($self) = @_;
        return $self->{imageColor};
}


sub setColor {
    my ($self, $color) = @_;
        $self->{color} = $color;
}


sub getColor {
    my ($self) = @_;
        return $self->{color};
}


sub setVersionSelector {
    my ($self, $versionSelector) = @_;
        $self->{versionSelector} = $versionSelector;
}


sub getVersionSelector {
    my ($self) = @_;
        return $self->{versionSelector};
}


sub setType {
    my ($self, $type) = @_;
        $self->{type} = $type;
}


sub getType {
    my ($self) = @_;
        return $self->{type};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        $stringBuffer->append(" isOpenGL: ");
        $stringBuffer->appendboolean($self->isOpenGL());
        $stringBuffer->append(" VersionSelector: ");
        $stringBuffer->append($stringUtil->toString($self->getVersionSelector()));
        $stringBuffer->append(" Type: ");
        $stringBuffer->append($stringUtil->toString($self->getType()));
        $stringBuffer->append(" Image Color: ");
        $stringBuffer->append($stringUtil->toString($self->getImageColor()));
        $stringBuffer->append(" Color: ");
        $stringBuffer->append($stringUtil->toString($self->getColor()));
        return $stringBuffer->toString();
}

use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::game::configuration::event::ChangedGameFeatureListener;
use org::allbinary::game::configuration::feature::Feature;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::MainFeatureFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;

1;

