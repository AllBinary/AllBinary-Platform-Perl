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

package org::allbinary::input::automation::module::game::test::TestInputAutomationCaptureWorker;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::AbstractInputAutomationWorker';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{genericProfileActions} = undef;
    $self->{MESSAGE} = "GenericInputAutomationCaptureWorker";
    $self->{PROCESS_DATA_WORKER_RESULTS} = "processDataWorkerResults";
    $self->{IMAGE_AVAILABLE_SO_PROCESSING} = "Image Available so processing";
    $self->{IMAGE_NOT_AVAILABLE} = "Image Not Available";
}


sub new {
    my ($class, $inputAutomationActionInterface, $genericProfileActions, $imageComparatorConstraintsInterface, $motionRectangleConstraintsInterface) = @_;
    my $self = $class->SUPER::new($inputAutomationActionInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF($self->{MESSAGE}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->setGenericProfileActions($genericProfileActions);
    return $self;
}


# throws Exception
sub processDataWorkerResults {
    my ($self) = @_;
        my $cacheInterface = 'org::allbinary::input::media::image::capture::CapturedBufferedImagesCacheSingleton'->getInstance();
        if ($cacheInterface->keySet()->size() > 0) {
            $self->{logUtil}->putF($self->{IMAGE_AVAILABLE_SO_PROCESSING}, $self, $self->{PROCESS_DATA_WORKER_RESULTS});
            my $anyType = $cacheInterface->keySet()->toArray()->[0];
            my $hashMap = $self->getGenericProfileActions()->getHashMap();
            my $set = $hashMap->keySet();
            my $actionNameArray = $set->toArray();
            my $size = scalar(@{$actionNameArray});
            for (my $index = 0; $index < $size; $index++) {
                my $actionNameString = $actionNameArray->[$index];
                my $genericProfileAction = $hashMap->get($actionNameString);
                my $genericProfileActionScript = $genericProfileAction->getGenericProfileActionScript();
                my $vector = $genericProfileActionScript->getProfileActionConditionInterfaceVector();
            }
            $cacheInterface->get($anyType);
        } else {
            $self->{logUtil}->putF($self->{IMAGE_NOT_AVAILABLE}, $self, $self->{PROCESS_DATA_WORKER_RESULTS});
        }
}


# throws Exception
sub process {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{PROCESS});
        $self->startDataWorkers();
        $self->processDataWorkerResults();
}


sub getGenericProfileActions {
    my ($self) = @_;
        return $self->{genericProfileActions};
}


sub setGenericProfileActions {
    my ($self, $genericProfileActions) = @_;
        $self->{genericProfileActions} = $genericProfileActions;
}

use java::util::HashMap;
# use java::util::Set;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::input::automation::module::AbstractInputAutomationWorker;
use org::allbinary::input::automation::module::InputAutomationActionInterface;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileAction;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActions;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::script::GenericProfileActionScript;
use org::allbinary::input::media::image::capture::CapturedBufferedImagesCacheSingleton;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::util::cache::J2SECacheInterface;
use org::allbinary::media::image::comparison::ImageComparatorConstraintsInterface;
use org::allbinary::media::image::comparison::motion::MotionRectangleConstraintsInterface;

1;

