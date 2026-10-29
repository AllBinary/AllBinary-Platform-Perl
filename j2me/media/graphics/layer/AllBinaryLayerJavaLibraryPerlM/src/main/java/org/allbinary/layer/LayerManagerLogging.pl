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

package org::allbinary::layer::LayerManagerLogging;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::LayerManagerLoggingBase';

our $instance = 'org::allbinary::layer::LayerManagerLogging'->new();
our $removeFailed = 0;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{stringBuilder} = 'org::allbinary::logic::string::StringMaker'->new();
    $self->{APPEND} = "append";
    $self->{APPEND_} = " append: ";
    $self->{_AT_} = " at: ";
    $self->{ATTEMPT_REMOVE_} = " Remove Attempt: ";
    $self->{REMOVE_} = " Remove: ";
    $self->{REMOVE} = "remove";
    $self->{DID_NOT_REMOVE} = " Did not remove: ";
    $self->{CLEAR} = " Clear List";
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::layer::LayerManagerLogging::instance;
}


# throws Exception
sub append {
    my ($self, $layerInterface) = @_;
        $self->{stringBuilder}->delete(0, $self->{stringBuilder}->length());
        $self->{logUtil}->putF($self->{stringBuilder}->appendint(int('org::allbinary::TsUtil'->getInstance()->hashCode($self)))->append($self->{APPEND_})->append($layerInterface->getName())->toString(), $self, $self->{APPEND});
}


sub appendAt {
    my ($self, $layerInterface, $index) = @_;
        $self->{stringBuilder}->delete(0, $self->{stringBuilder}->length());
        $self->{logUtil}->putF($self->{stringBuilder}->appendint(int('org::allbinary::TsUtil'->getInstance()->hashCode($self)))->append($self->{APPEND_})->append($layerInterface->getName())->append($self->{_AT_})->appendint($index)->toString(), $self, $self->{APPEND});
}


sub remove {
    my ($self, $layerInterface) = @_;
        if (!defined($layerInterface)) {
            $self->{stringBuilder}->delete(0, $self->{stringBuilder}->length());
            $self->{logUtil}->putF($self->{stringBuilder}->appendint(int('org::allbinary::TsUtil'->getInstance()->hashCode($self)))->append($self->{ATTEMPT_REMOVE_})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($layerInterface))->toString(), $self, $self->{REMOVE});
        } else {
            $self->{stringBuilder}->delete(0, $self->{stringBuilder}->length());
            $self->{logUtil}->putF($self->{stringBuilder}->appendint(int('org::allbinary::TsUtil'->getInstance()->hashCode($self)))->append($self->{ATTEMPT_REMOVE_})->append($layerInterface->getName())->toString(), $self, $self->{REMOVE});
        }
}


sub removeResult {
    my ($self, $layerManager, $layerInterface, $result) = @_;
        if (!defined($layerInterface)) {
            $self->{stringBuilder}->delete(0, $self->{stringBuilder}->length());
            $self->{logUtil}->putF($self->{stringBuilder}->appendint(int('org::allbinary::TsUtil'->getInstance()->hashCode($self)))->append($self->{REMOVE_})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($layerInterface))->toString(), $self, $self->{REMOVE});
        } elsif ($result) {
            if ($org::allbinary::layer::LayerManagerLogging::removeFailed) {
                $self->{stringBuilder}->delete(0, $self->{stringBuilder}->length());
                $self->{logUtil}->putF($self->{stringBuilder}->appendint(int('org::allbinary::TsUtil'->getInstance()->hashCode($self)))->append($self->{REMOVE_})->append($layerInterface->getName())->toString(), $self, $self->{REMOVE});
            }
        } else {
            $self->{stringBuilder}->delete(0, $self->{stringBuilder}->length());
            $self->{logUtil}->putF($self->{stringBuilder}->appendint(int('org::allbinary::TsUtil'->getInstance()->hashCode($self)))->append($self->{DID_NOT_REMOVE})->append($layerInterface->getName())->toString(), $self, $self->{REMOVE});
            $org::allbinary::layer::LayerManagerLogging::removeFailed = 1;
        }
}


sub log {
    my ($self, $layerManager) = @_;
        $self->{stringBuilder}->delete(0, $self->{stringBuilder}->length());
        my $size = $layerManager->getSize();
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        $self->{stringBuilder}->append(sprintf("%x", 'org::allbinary::TsUtil'->getInstance()->hashCode($layerManager)))->append($commonSeps->{COLON_SEP});
        $self->{stringBuilder}->appendint($size)->append($commonSeps->{COLON_SEP});
        my $allBinaryLayer = undef;
        for (my $index = 0; $index < $size; $index++) {
            $allBinaryLayer = ($layerManager->getLayerAt($index));
            $self->{stringBuilder}->append($allBinaryLayer->getName())->append($commonSeps->{COMMA});
        }
        $self->{logUtil}->putF($self->{stringBuilder}->toString(), $self, $self->{REMOVE});
}


sub clear {
    my ($self) = @_;
        $self->{stringBuilder}->delete(0, $self->{stringBuilder}->length());
        $self->{logUtil}->putF($self->{stringBuilder}->appendint(int('org::allbinary::TsUtil'->getInstance()->hashCode($self)))->append($self->{CLEAR})->toString(), $self, $self->{CLEAR});
}

use org::allbinary::TsUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::layer::LayerManagerLoggingBase;

1;

