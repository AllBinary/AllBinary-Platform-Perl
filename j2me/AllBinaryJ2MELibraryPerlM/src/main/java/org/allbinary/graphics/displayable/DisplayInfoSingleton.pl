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

package org::allbinary::graphics::displayable::DisplayInfoSingleton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();

our $SINGLETON = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonLabels} = 'org::allbinary::string::CommonLabels'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{ORIENTATION} = "ORIENTATION";
    $self->{ADJUSTING_FOR_SCALING_IN_PORTRAIT} = "Adjusting for Scaling in portrait display ratio: ";
    $self->{ADJUSTING_FOR_SCALING_IN_LANDSCAPE} = "Adjusting for Scaling in landscape display ratio: ";
    $self->{last} = [(0) x (4)];
    $self->{lastHalf} = [(0) x (4)];
    $self->{full} = [(0) x (4)];
    $self->{top} = 0;
    $self->{left} = 0;
    $self->{xOffset} = 0;
    $self->{yOffset} = 0;
    $self->{scaleLargestTo} = 0.0;
    $self->{WIDTH} = 0;
    $self->{HEIGHT} = 1;
    $self->{CUSTOM_WIDTH} = 2;
    $self->{CUSTOM_HEIGHT} = 3;
    $self->{scalableListener} = 'org::allbinary::graphics::displayable::BaseScalable'->new();
    $self->{displayRatio} = 0.0;
    $self->{ratio} = 1.0;
    $self->{SET_LAST_SIZE_METHOD_NAME} = "setLastSize";
    $self->{FULL_WIDTH} = " FullWidth: ";
    $self->{FULL_HEIGHT} = " FullHeight: ";
    $self->{LAST_WIDTH} = "LastWidth: ";
    $self->{LAST_HEIGHT} = " LastHeight: ";
    $self->{PORTRAIT} = "Portrait";
    $self->{LANDSCAPE} = "Landscape";
    $self->{displayChangeEvent} = 'org::allbinary::graphics::displayable::event::DisplayChangeEvent'->new($self);
    $self->{FIRE_METHOD_NAME} = "fire";
    $self->{REASON} = "reason: ";
    $self->{UPDATE_FROM_ORIENTATION_CHANGE} = "Updating from Orientation Change ";
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{DISPLAY_INFO} = "Display Info: ";
    $self->{FULL} = "full";
    $self->{LAST} = "last";
    $self->{LAST_HALF} = "lastHalf";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::displayable::DisplayInfoSingleton::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $size = scalar(@{$self->{last}});
        for (my $index = 0; $index < $size; $index++) {
            $self->{last}->[$index] = 0;
            $self->{lastHalf}->[$index] = 0;
            $self->{full}->[$index] = 0;
        }
        if ('org::allbinary::AndroidUtil'->isAndroid()) {
            $self->{scaleLargestTo} = 640.0;
        } else {
            $self->{scaleLargestTo} = 1080.0;
        }
    return $self;
}


sub getLastHalf {
    my ($self) = @_;
        return $self->{lastHalf};
}


sub getLast {
    my ($self) = @_;
        return $self->{last};
}


sub getFull {
    my ($self) = @_;
        return $self->{full};
}


sub getScaleLargestTo {
    my ($self) = @_;
        return $self->{scaleLargestTo};
}


sub setScaleLargestTo {
    my ($self, $scaleLargestTo) = @_;
        $self->{scaleLargestTo} = $scaleLargestTo;
}


sub setLastSize {
    my ($self, $aLastWidth, $aLastHeight, $reason) = @_;
        if ($self->{full}->[$self->{WIDTH}] != $aLastWidth || $self->{full}->[$self->{HEIGHT}] != $aLastHeight) {
            $self->setLastSizeForce($aLastWidth, $aLastHeight, $reason);
        }
}


sub setLastSizeForce {
    my ($self, $aLastWidth, $aLastHeight, $reason) = @_;
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        $self->{logUtil}->putF($stringMaker->append('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL})->append($reason)->toString(), $self, $self->{SET_LAST_SIZE_METHOD_NAME});
        my $aFullWidth = $aLastWidth;
        my $aFullHeight = $aLastHeight;
        $stringMaker->delete(0, $stringMaker->length());
        $self->{logUtil}->putF($stringMaker->append($self->{FULL_WIDTH})->appendint($aFullWidth)->append($self->{FULL_HEIGHT})->appendint($aFullHeight)->append($self->toString())->toString(), $self, $self->{SET_LAST_SIZE_METHOD_NAME});
        my $operatingSystemInterface = 'org::allbinary::logic::system::os::OperatingSystemFactory'->getInstance()->getOperatingSystemInstance();
        if ($operatingSystemInterface->isOverScan()) {
            $aLastWidth = $aLastWidth * $operatingSystemInterface->getOverScanXPercent() / 100;
            $aLastHeight = $aLastHeight * $operatingSystemInterface->getOverScanYPercent() / 100;
        }
        if ($operatingSystemInterface->isScalable()) {
            if ($self->isPortraitWH($aLastWidth, $aLastHeight)) {
                if ($aLastHeight > $self->{scaleLargestTo}) {
                    $self->{displayRatio} = $self->{scaleLargestTo} / $aLastHeight;
                    $self->{ratio} = $aLastHeight / $self->{scaleLargestTo};
                    $stringMaker->delete(0, $stringMaker->length());
                    $self->{logUtil}->putF($stringMaker->append($self->{ADJUSTING_FOR_SCALING_IN_PORTRAIT})->appendfloat($self->{displayRatio})->toString(), $self, $self->{SET_LAST_SIZE_METHOD_NAME});
                    $aLastWidth = int(($aLastWidth * $self->{displayRatio}));
                    $aLastHeight = int(($aLastHeight * $self->{displayRatio}));
                    $self->{scalableListener}->scale($self->{ratio});
                } else {
                    $self->{ratio} = 1.0;
                    $self->{scalableListener}->scale($self->{ratio});
                }
            } else {
                if ($aLastWidth > $self->{scaleLargestTo}) {
                    $self->{displayRatio} = $self->{scaleLargestTo} / $aLastWidth;
                    $self->{ratio} = $aLastWidth / $self->{scaleLargestTo};
                    $stringMaker->delete(0, $stringMaker->length());
                    $self->{logUtil}->putF($stringMaker->append($self->{ADJUSTING_FOR_SCALING_IN_LANDSCAPE})->appendfloat($self->{displayRatio})->toString(), $self, $self->{SET_LAST_SIZE_METHOD_NAME});
                    $aLastWidth = int(($aLastWidth * $self->{displayRatio}));
                    $aLastHeight = int(($aLastHeight * $self->{displayRatio}));
                    $self->{scalableListener}->scale($self->{ratio});
                } else {
                    $self->{ratio} = 1.0;
                    $self->{scalableListener}->scale($self->{ratio});
                }
            }
        }
        $stringMaker->delete(0, $stringMaker->length());
        $self->{logUtil}->putF($stringMaker->append($self->{LAST_WIDTH})->appendint($aLastWidth)->append($self->{LAST_HEIGHT})->appendint($aLastHeight)->toString(), $self, $self->{SET_LAST_SIZE_METHOD_NAME});
        $self->{xOffset} = $aFullWidth - $aLastWidth;
        $self->{yOffset} = $aFullHeight - $aLastHeight;
        $self->{left} = $self->{scalableListener}->getLeft($self->{xOffset});
        $self->{top} = $self->{scalableListener}->getTop($self->{yOffset});
        $self->{full}->[$self->{WIDTH}] = $aFullWidth;
        $self->{full}->[$self->{HEIGHT}] = $aFullHeight;
        $self->{last}->[$self->{WIDTH}] = $aLastWidth;
        $self->{lastHalf}->[$self->{WIDTH}] = (POSIX::floor(($self->{last}->[$self->{WIDTH}]) / (2 ** (1))));
        $self->{last}->[$self->{HEIGHT}] = $aLastHeight;
        $self->{lastHalf}->[$self->{HEIGHT}] = (POSIX::floor(($self->{last}->[$self->{HEIGHT}]) / (2 ** (1))));
        'org::allbinary::graphics::threed::SWTJOGLProcessor'->getInstance()->setCustom($aLastWidth, $aLastHeight, $self->{ratio});
        $self->add($self->{SET_LAST_SIZE_METHOD_NAME});
}


sub isPortraitWH {
    my ($self, $lastWidth, $lastHeight) = @_;
        if ($lastHeight > $lastWidth) {
            return 1;
        } else {
            return 0;
        }
}


sub isPortrait {
    my ($self) = @_;
        return $self->isPortraitWH($self->{last}->[$self->{WIDTH}], $self->{last}->[$self->{HEIGHT}]);
}


sub add {
    my ($self, $reason) = @_;
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        $self->{logUtil}->putF($stringMaker->append($self->{REASON})->append($reason)->toString(), $self, $self->{FIRE_METHOD_NAME});
        $stringMaker->delete(0, $stringMaker->length());
        $self->{logUtil}->putF($self->toStringAppend($stringMaker), $self, $self->{FIRE_METHOD_NAME});
        $self->{list}->add($reason);
}


sub process {
    my ($self) = @_;
        try {
            if ($self->{list}->size() > 0) {
                $self->processForced();
            }
            $self->{list}->clear();
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self, $self->{FIRE_METHOD_NAME}, $e);
        }
}


sub processForced {
    my ($self) = @_;
        try {
            my $swtJOGLProcessor = 'org::allbinary::graphics::threed::SWTJOGLProcessor'->getInstance();
            $swtJOGLProcessor->clear();
            'org::allbinary::graphics::displayable::event::DisplayChangeEventHandler'->getInstance()->fireEvent($self->{displayChangeEvent});
            'org::allbinary::graphics::displayable::event::LastDisplayChangeEventHandler'->getInstance()->fireEvent($self->{displayChangeEvent});
            $swtJOGLProcessor->onSurfaceChanged();
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self, $self->{FIRE_METHOD_NAME}, $e);
        }
}


sub update {
    my ($self, $displayable, $reason) = @_;
        my $aLastWidth = $displayable->getWidth();
        my $aLastHeight = $displayable->getHeight();
        my $aFullWidth = $aLastWidth;
        my $aFullHeight = $aLastHeight;
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        $self->{logUtil}->putF($stringMaker->append('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL})->append($reason)->append($self->{LAST_WIDTH})->appendint($aLastWidth)->append($self->{LAST_HEIGHT})->appendint($aLastHeight)->append($self->{commonSeps}->{SPACE})->append($self->toString())->toString(), $self, $self->{commonStrings}->{UPDATE});
        if ($aLastWidth > 0 && $aLastHeight > 0) {
            my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
            my $openGLFeatureFactory = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance();
            if (!$features->isDefault($openGLFeatureFactory->{OPENGL}) || $self->{last}->[$self->{WIDTH}] != $aLastWidth || $self->{last}->[$self->{HEIGHT}] != $aLastHeight) {
                $stringMaker->delete(0, $stringMaker->length());
                $self->{logUtil}->putF($stringMaker->append($self->{UPDATE_FROM_ORIENTATION_CHANGE})->toString(), $self, $self->{commonStrings}->{UPDATE});
                my $operatingSystemInterface = 'org::allbinary::logic::system::os::OperatingSystemFactory'->getInstance()->getOperatingSystemInstance();
                if ($operatingSystemInterface->isOverScan()) {
                    $aLastWidth = $aLastWidth * $operatingSystemInterface->getOverScanXPercent() / 100;
                    $aLastHeight = $aLastHeight * $operatingSystemInterface->getOverScanYPercent() / 100;
                }
                if ($operatingSystemInterface->isScalable()) {
                    if ($self->isPortraitWH($aLastWidth, $aLastHeight)) {
                        if ($aLastHeight > $self->{scaleLargestTo}) {
                            $self->{displayRatio} = $self->{scaleLargestTo} / $aLastHeight;
                            $self->{ratio} = $aLastHeight / $self->{scaleLargestTo};
                            $stringMaker->delete(0, $stringMaker->length());
                            $self->{logUtil}->putF($stringMaker->append($self->{ADJUSTING_FOR_SCALING_IN_PORTRAIT})->appendfloat($self->{displayRatio})->toString(), $self, $self->{commonStrings}->{UPDATE});
                            $aLastWidth = int(($aLastWidth * $self->{displayRatio}));
                            $aLastHeight = int(($aLastHeight * $self->{displayRatio}));
                            $self->{scalableListener}->scale($self->{ratio});
                        } else {
                            $self->{ratio} = 1.0;
                            $self->{scalableListener}->scale($self->{ratio});
                        }
                    } else {
                        if ($aLastWidth > $self->{scaleLargestTo}) {
                            $self->{displayRatio} = $self->{scaleLargestTo} / $aLastWidth;
                            $self->{ratio} = $aLastWidth / $self->{scaleLargestTo};
                            $stringMaker->delete(0, $stringMaker->length());
                            $self->{logUtil}->putF($stringMaker->append($self->{ADJUSTING_FOR_SCALING_IN_LANDSCAPE})->appendfloat($self->{displayRatio})->toString(), $self, $self->{commonStrings}->{UPDATE});
                            $aLastWidth = int(($aLastWidth * $self->{displayRatio}));
                            $aLastHeight = int(($aLastHeight * $self->{displayRatio}));
                            $self->{scalableListener}->scale($self->{ratio});
                        } else {
                            $self->{ratio} = 1.0;
                            $self->{scalableListener}->scale($self->{ratio});
                        }
                    }
                }
                $stringMaker->delete(0, $stringMaker->length());
                $self->{logUtil}->putF($stringMaker->append($self->{UPDATE_FROM_ORIENTATION_CHANGE})->append($self->{LAST_WIDTH})->appendint($aLastWidth)->append($self->{LAST_HEIGHT})->appendint($aLastHeight)->toString(), $self, $self->{commonStrings}->{UPDATE});
                $self->{xOffset} = $aFullWidth - $aLastWidth;
                $self->{yOffset} = $aFullHeight - $aLastHeight;
                $self->{left} = $self->{scalableListener}->getLeft($self->{xOffset});
                $self->{top} = $self->{scalableListener}->getTop($self->{yOffset});
                $self->{full}->[$self->{WIDTH}] = $aFullWidth;
                $self->{full}->[$self->{HEIGHT}] = $aFullHeight;
                $self->{last}->[$self->{WIDTH}] = $aLastWidth;
                $self->{lastHalf}->[$self->{WIDTH}] = (POSIX::floor(($self->{last}->[$self->{WIDTH}]) / (2 ** (1))));
                $self->{last}->[$self->{HEIGHT}] = $aLastHeight;
                $self->{lastHalf}->[$self->{HEIGHT}] = (POSIX::floor(($self->{last}->[$self->{HEIGHT}]) / (2 ** (1))));
                'org::allbinary::graphics::threed::SWTJOGLProcessor'->getInstance()->setCustom($aLastWidth, $aLastHeight, $self->{ratio});
                $self->add($self->{commonStrings}->{UPDATE});
            }
        }
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        return $self->toStringAppend($stringBuffer);
}


sub toStringAppend {
    my ($self, $stringBuffer) = @_;
        $stringBuffer->append($self->{DISPLAY_INFO});
        $stringBuffer->append($self->{FULL});
        $stringBuffer->append($self->{commonLabels}->{WIDTH_LABEL});
        $stringBuffer->appendint($self->{full}->[$self->{WIDTH}]);
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($self->{FULL});
        $stringBuffer->append($self->{commonLabels}->{HEIGHT_LABEL});
        $stringBuffer->appendint($self->{full}->[$self->{HEIGHT}]);
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($self->{LAST});
        $stringBuffer->append($self->{commonLabels}->{WIDTH_LABEL});
        $stringBuffer->appendint($self->{last}->[$self->{WIDTH}]);
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($self->{LAST});
        $stringBuffer->append($self->{commonLabels}->{HEIGHT_LABEL});
        $stringBuffer->appendint($self->{last}->[$self->{HEIGHT}]);
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($self->{LAST_HALF});
        $stringBuffer->append($self->{commonLabels}->{WIDTH_LABEL});
        $stringBuffer->appendint($self->{lastHalf}->[$self->{WIDTH}]);
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append($self->{LAST_HALF});
        $stringBuffer->append($self->{commonLabels}->{HEIGHT_LABEL});
        $stringBuffer->appendint($self->{lastHalf}->[$self->{HEIGHT}]);
        $stringBuffer->append($self->{commonSeps}->{SPACE});
        $stringBuffer->append(($self->isPortrait() ? $self->{PORTRAIT} : $self->{LANDSCAPE}));
        return $stringBuffer->toString();
}


sub getTop {
    my ($self) = @_;
        return $self->{top};
}


sub getLeft {
    my ($self) = @_;
        return $self->{left};
}


sub getLastWidth {
    my ($self) = @_;
        return $self->{last}->[$self->{WIDTH}];
}


sub getLastHeight {
    my ($self) = @_;
        return $self->{last}->[$self->{HEIGHT}];
}


sub getLastHalfWidth {
    my ($self) = @_;
        return $self->{lastHalf}->[$self->{WIDTH}];
}


sub getLastHalfHeight {
    my ($self) = @_;
        return $self->{lastHalf}->[$self->{HEIGHT}];
}


sub getCustomLastWidth {
    my ($self) = @_;
        return $self->{last}->[$self->{CUSTOM_WIDTH}];
}


sub getCustomLastHeight {
    my ($self) = @_;
        return $self->{last}->[$self->{CUSTOM_HEIGHT}];
}


sub getRawLastWidth {
    my ($self) = @_;
        return $self->{last}->[$self->{WIDTH}];
}


sub getRawLastHeight {
    my ($self) = @_;
        return $self->{last}->[$self->{HEIGHT}];
}


sub setCustom {
    my ($self, $width, $height) = @_;
        $self->{last}->[$self->{CUSTOM_WIDTH}] = $width;
        $self->{lastHalf}->[$self->{CUSTOM_WIDTH}] = (POSIX::floor(($self->{last}->[$self->{CUSTOM_WIDTH}]) / (2 ** (1))));
        $self->{last}->[$self->{CUSTOM_HEIGHT}] = $height;
        $self->{lastHalf}->[$self->{CUSTOM_HEIGHT}] = (POSIX::floor(($self->{last}->[$self->{CUSTOM_HEIGHT}]) / (2 ** (1))));
}


sub setScalableListener {
    my ($self, $scalableListener) = @_;
        $self->{scalableListener} = $scalableListener;
}


sub getScalableListener {
    my ($self) = @_;
        return $self->{scalableListener};
}


sub getRatio {
    my ($self) = @_;
        return $self->{ratio};
}


sub getDisplayRatio {
    my ($self) = @_;
        return $self->{displayRatio};
}


sub setOffset {
    my ($self, $left, $top) = @_;
        $self->{left} = $left;
}


sub getxOffset {
    my ($self) = @_;
        return $self->{xOffset};
}


sub getyOffset {
    my ($self) = @_;
        return $self->{yOffset};
}

# use javax::microedition::lcdui::Displayable;
use org::allbinary::AndroidUtil;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::graphics::displayable::event::DisplayChangeEvent;
use org::allbinary::graphics::displayable::event::DisplayChangeEventHandler;
use org::allbinary::graphics::displayable::event::LastDisplayChangeEventHandler;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::graphics::threed::SWTJOGLProcessor;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::os::GenericOperatingSystem;
use org::allbinary::logic::system::os::OperatingSystemFactory;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::graphics::displayable::BaseScalable;

1;

