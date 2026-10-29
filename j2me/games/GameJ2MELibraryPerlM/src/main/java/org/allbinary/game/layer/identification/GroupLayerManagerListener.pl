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

package org::allbinary::game::layer::identification::GroupLayerManagerListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::event::LayerManagerEventListener';

our $SINGLETON = 'org::allbinary::game::layer::identification::GroupLayerManagerListener'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::identification::GroupLayerManagerListener::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        'org::allbinary::layer::event::LayerManagerEventHandler'->getInstance()->addListener($self);
    return $self;
}


sub clear {
    my ($self) = @_;
        my $groupList = undef;
        my $size = $self->{list}->size();
        for (my $index = $size - 1; $index >= 0; $index--) {
            $groupList = $self->{list}->{objectArray}->[$index];
            $groupList->clear();
        }
}


sub getGroupSizeFromInterface {
    my ($self, $groupInterfaceCompositeInterface) = @_;
        my $groupInterfaceArray = $groupInterfaceCompositeInterface->getGroupInterface();
        return $self->getGroupSize($groupInterfaceArray->[0]);
}


sub getGroupSize {
    my ($self, $groupInterface) = @_;
        my $id = int($groupInterface->getGroupId());
        return $self->getGroupSizeById($id);
}


sub getList {
    my ($self, $groupInterface) = @_;
        my $id = int($groupInterface->getGroupId());
        return $self->getListById($id);
}


sub getListById {
    my ($self, $groupId) = @_;
        my $groupList = $self->{list}->{objectArray}->[$groupId];
        return $groupList;
}


sub getGroupSizeById {
    my ($self, $groupId) = @_;
        my $groupList = $self->{list}->{objectArray}->[$groupId];
        my $size = $groupList->size();
        return $size;
}


sub areAllOtherGroupsEmpty {
    my ($self, $groupInterface) = @_;
        my $id = int($groupInterface->getGroupId());
        my $size = $self->{list}->size();
        for (my $index = $size - 1; $index >= 0; $index--) {
            if ($id != $index) {
                my $groupSize = $self->getGroupSizeById($index);
                if ($groupSize != 0) {
                    $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Group Size: ")->appendint($groupSize)->toString(), $self, "areAllOtherGroupsEmpty");
                    return 0;
                }
            }
        }
        return 1;
}


sub isIdInList {
    my ($self, $id, $excludeGroupList) = @_;
        my $size = $excludeGroupList->size();
        my $groupInterfaceArray = undef;
        my $groupInterface = undef;
        my $groupId = 0;
        for (my $index = $size - 1; $index >= 0; $index--) {
            $groupInterfaceArray = $excludeGroupList->{objectArray}->[$index];
            my $size2 = scalar(@{$groupInterfaceArray});
            for (my $index2 = 0; $index2 < $size2; $index2++) {
                $groupInterface = $groupInterfaceArray->[$index2];
                $groupId = int($groupInterface->getGroupId());
                if ($groupId == $id) {
                    return 1;
                }
            }
        }
        return 0;
}


sub areAllOtherGroupsLessThan {
    my ($self, $excludeGroupList, $maxSize) = @_;
        my $size = $self->{list}->size();
        for (my $index = $size - 1; $index >= 0; $index--) {
            if (!$self->isIdInList($index, $excludeGroupList)) {
                my $groupSize = $self->getGroupSizeById($index);
                if ($groupSize >= $maxSize) {
                    return 0;
                }
            }
        }
        return 1;
}


sub init {
    my ($self, $total) = @_;
        while ($self->{list}->size() <= $total + 1) {
            $self->{list}->add('org::allbinary::util::BasicArrayListD'->new());
        }
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


# throws Exception
sub onCreateLayerManagerEvent {
    my ($self, $layerManagerEvent) = @_;
        my $layerInterface = $layerManagerEvent->getLayerInterface();
        my $groupInterfaceArray = $layerInterface->getGroupInterface();
        my $size = scalar(@{$groupInterfaceArray});
        my $id = 0;
        my $groupList = undef;
        for (my $index = 0; $index < $size; $index++) {
            $id = int($groupInterfaceArray->[$index]->getGroupId());
            $groupList = $self->{list}->{objectArray}->[$id];
            if (!defined($groupList)) {
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("id: ")->appendint($id)->toString(), $self, "onCreateLayerManagerEvent");
            }
            if (!$groupList->contains($layerInterface)) {
                $groupList->add($layerInterface);
            } else {
            }
        }
}


# throws Exception
sub onDeleteLayerManagerEvent {
    my ($self, $layerManagerEvent) = @_;
        my $layerInterface = $layerManagerEvent->getLayerInterface();
        my $groupInterfaceArray = $layerInterface->getGroupInterface();
        my $size = scalar(@{$groupInterfaceArray});
        my $id = 0;
        my $groupList = undef;
        for (my $index = 0; $index < $size; $index++) {
            $id = int($groupInterfaceArray->[$index]->getGroupId());
            $groupList = $self->{list}->{objectArray}->[$id];
            $groupList->remove($layerInterface);
        }
}


sub log {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $GROUP = "Group: ";
        my $SPACE = 'org::allbinary::string::CommonSeps'->getInstance()->{SPACE};
        my $TOTAL_LABEL = 'org::allbinary::string::CommonLabels'->getInstance()->{TOTAL_LABEL};
        my $size = $self->{list}->size();
        for (my $index = $size - 1; $index >= 0; $index--) {
            my $groupList = $self->{list}->{objectArray}->[$index];
            $stringBuffer->append($GROUP);
            $stringBuffer->appendint($index);
            $stringBuffer->append($SPACE);
            $stringBuffer->append($TOTAL_LABEL);
            $stringBuffer->appendint($groupList->size());
            $stringBuffer->append($SPACE);
        }
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "log");
}

use org::allbinary::game::identification::Group;
use org::allbinary::game::identification::GroupInterfaceCompositeInterface;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::event::LayerManagerEvent;
use org::allbinary::layer::event::LayerManagerEventHandler;
use org::allbinary::layer::event::LayerManagerEventListener;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

