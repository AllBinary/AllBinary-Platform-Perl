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
    $self->{FILE} = "OpenGLConfiguration.dat";
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
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
        try {
            if ('org::allbinary::logic::io::file::FileFactory'->getInstance()->isFile($self->{FILE})) {
                $self->read();
            } else {
                $self->write();
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
        }
    return $self;
}


# throws Exception
sub read {
    my ($self) = @_;
        my $openGLFeatureFactory = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance();
        my $fileInputStreamFactory = 'org::allbinary::logic::io::FileStreamFactory'->getInstance();
        my $fileInputStream = $fileInputStreamFactory->getFileInputStreamInstance('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $self->{FILE});
        my $dataInputStream = 'java::io::DataInputStream'->new($fileInputStream);
        my $openGLValue = $dataInputStream->readInt();
        if ($openGLValue == 0) {
            $self->setOpenGL(0);
        } elsif ($openGLValue == 1) {
            $self->setOpenGL(1);
        } else {
            die ("Invalid OpenGL Setting");
        }
        my $version = $dataInputStream->readUTF();
        if ($self->{tsUtil}->compareTo($version, $openGLFeatureFactory->{OPENGL_AUTO_SELECT}->getName()) == 0) {
            $self->setVersionSelector($openGLFeatureFactory->{OPENGL_AUTO_SELECT});
        } elsif ($self->{tsUtil}->compareTo($version, $openGLFeatureFactory->{OPENGL_MINIMUM}->getName()) == 0) {
            $self->setVersionSelector($openGLFeatureFactory->{OPENGL_MINIMUM});
        } else {
            die ("OpenGLConfiguration: Error reading version selector: " . $version);
        }
        my $type = $dataInputStream->readUTF();
        if ($self->{tsUtil}->compareTo($type, $openGLFeatureFactory->{OPENGL_AS_GAME_THREAD}->getName()) == 0) {
            $self->setType($openGLFeatureFactory->{OPENGL_AS_GAME_THREAD});
        } elsif ($self->{tsUtil}->compareTo($type, $openGLFeatureFactory->{OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS}->getName()) == 0) {
            $self->setType($openGLFeatureFactory->{OPENGL_AND_GAME_HAVE_DIFFERENT_THREADS});
        } else {
            die ("OpenGLConfiguration: Error reading image color");
        }
        my $imageColor = $dataInputStream->readUTF();
        if ($self->{tsUtil}->compareTo($imageColor, $openGLFeatureFactory->{IMAGE_COLOR_DEPTH_4444}->getName()) == 0) {
            $self->setImageColor($openGLFeatureFactory->{IMAGE_COLOR_DEPTH_4444});
        } elsif ($self->{tsUtil}->compareTo($imageColor, $openGLFeatureFactory->{IMAGE_COLOR_DEPTH_4444}->getName()) == 0) {
            $self->setImageColor($openGLFeatureFactory->{IMAGE_COLOR_DEPTH_4444});
        } elsif ($self->{tsUtil}->compareTo($imageColor, $openGLFeatureFactory->{IMAGE_COLOR_DEPTH_4444}->getName()) == 0) {
            $self->setImageColor($openGLFeatureFactory->{IMAGE_COLOR_DEPTH_4444});
        } else {
            die ("OpenGLConfiguration: Error reading image color: " . $imageColor);
        }
        my $color = $dataInputStream->readUTF();
        if ($self->{tsUtil}->compareTo($color, $openGLFeatureFactory->{OPENGL_COLOR_DEPTH_4444}->getName()) == 0) {
            $self->setColor($openGLFeatureFactory->{OPENGL_COLOR_DEPTH_4444});
        } elsif ($self->{tsUtil}->compareTo($color, $openGLFeatureFactory->{OPENGL_COLOR_DEPTH_565}->getName()) == 0) {
            $self->setColor($openGLFeatureFactory->{OPENGL_COLOR_DEPTH_565});
        } elsif ($self->{tsUtil}->compareTo($color, $openGLFeatureFactory->{OPENGL_COLOR_DEPTH_8888}->getName()) == 0) {
            $self->setColor($openGLFeatureFactory->{OPENGL_COLOR_DEPTH_8888});
        } else {
            die ("OpenGLConfiguration: Error reading color: " . $color);
        }
        'org::allbinary::logic::communication::log::PreLogUtil'->put("Read Configuration: " . $self->toString(), $self, "read");
}


# throws Exception
sub write {
    my ($self) = @_;
        my $closeable = $org::allbinary::logic::io::NullCloseable::NULL_CLOSEABLE;
        try {
            'org::allbinary::logic::communication::log::PreLogUtil'->put("Write Configuration: " . $self->toString(), $self, "write");
            my $fileInputStreamFactory = 'org::allbinary::logic::io::FileStreamFactory'->getInstance();
            my $fileOutputStream = $fileInputStreamFactory->getFileOutputStreamInstance('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $self->{FILE});
            my $dataOutputStream = 'org::allbinary::logic::io::AbDataOutputStream'->new($fileOutputStream);
            $closeable = $dataOutputStream;
            if ($self->isOpenGL()) {
                $dataOutputStream->writeInt(1);
            } else {
                $dataOutputStream->writeInt(0);
            }
            $dataOutputStream->writeUTF($self->getVersionSelector()->getName());
            $dataOutputStream->writeUTF($self->getType()->getName());
            $dataOutputStream->writeUTF($self->getImageColor()->getName());
            $dataOutputStream->writeUTF($self->getColor()->getName());
            $dataOutputStream->flush();
        } catch ($e) {
            die $e;
        } finally {
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($closeable);
        }
}


# throws Exception
sub init {
    my ($self) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ('org::allbinary::game::configuration::event::ChangedGameFeatureListener'->getInstance()->isChangedFeature('org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance()->{STATIC})) {
            my $openGLFeatureFactory = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance();
            if ($self->isOpenGL()) {
                if ($features->isFeature($openGLFeatureFactory->{OPENGL_2D}) || $features->isFeature($openGLFeatureFactory->{OPENGL_3D}) || $features->isFeature($openGLFeatureFactory->{OPENGL_2D_AND_3D})) {
                    if (!$features->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL})) {
                        $self->{logUtil}->putF("Turning on OpenGL as Default", $self, $self->{commonStrings}->{INIT});
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
                    $self->{logUtil}->putF("OpenGL is enabled, but this game does not support OpenGL (Probably from installing with the same package name from a game that had OpenGL available)", $self, $self->{commonStrings}->{INIT});
                }
            } else {
                $self->{logUtil}->putF("OpenGL is Off", $self, $self->{commonStrings}->{INIT});
            }
        } else {
            if ($self->isOpenGL() && !$features->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL})) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put("OpenGL is set but not Enabled since statics where not cleared (Reboot or Complete exit is Required)", $self, $self->{commonStrings}->{INIT});
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
        if ($modified) {
            $self->write();
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

# use java::io::Closeable;
# use java::io::DataInputStream;
# use java::io::InputStream;
# use java::io::OutputStream;
use org::allbinary::TsUtil;
use org::allbinary::logic::io::AbDataOutputStream;
use org::allbinary::logic::io::FileStreamFactory;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::FileFactory;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::game::configuration::event::ChangedGameFeatureListener;
use org::allbinary::game::configuration::feature::Feature;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::MainFeatureFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::io::NullCloseable;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;

1;

