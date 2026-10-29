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

package org::allbinary::input::automation::module::generic::GenericInputAutomationWorker;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::AbstractInputAutomationWorker';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{PROCESS_DATA_WORKER_RESULTS} = "processDataWorkerResults";
    $self->{lastFrame} = -1;
    $self->{frame} = undef;
    $self->{genericProfile} = undef;
}


sub new {
    my ($class, $inputAutomationActionInterface, $genericProfile, $motionRectangleConstraintsInterface, $imageComparatorConstraintsInterface) = @_;
    my $self = $class->SUPER::new($inputAutomationActionInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->setCaptureWorker('org::allbinary::input::automation::module::generic::GenericProfileCaptureWorkerFactory'->getInstance($genericProfile));
        $self->setInputAutomationActionInterface($inputAutomationActionInterface);
        $self->setImageComparisonWorker('org::allbinary::media::image::comparison::ImageComparisonWorker'->new($imageComparatorConstraintsInterface));
        $self->setMotionRectanglesWorker('org::allbinary::media::image::comparison::motion::MotionRectanglesWorker'->new($motionRectangleConstraintsInterface));
        $self->setGenericProfile($genericProfile);
        my $vector = $self->getGenericProfile()->getGenericProfileDataWorkerTypeVector();
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $genericProfileDataWorkerType = $vector->get($index);
            $self->{logUtil}->putF("Adding Listener: " . $genericProfileDataWorkerType, $self, $self->{commonStrings}->{CONSTRUCTOR});
            if ($genericProfileDataWorkerType == $org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::COMPARISON) {
                $self->getCaptureWorker()->addListenerInterface($self->getImageComparisonWorker());
            } elsif ($genericProfileDataWorkerType == $org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType::MOTION) {
                $self->getImageComparisonWorker()->addListenerInterface($self->getMotionRectanglesWorker());
            }
        }
    return $self;
}


# throws Exception
sub processDataWorkerResults {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{PROCESS_DATA_WORKER_RESULTS});
        $self->waitForDataWorkers();
        my $cacheInterface = 'org::allbinary::input::media::image::capture::CapturedBufferedImagesCacheSingleton'->getInstance();
        my $keyArray = $cacheInterface->keySet()->toArray();
        if (scalar(@{$keyArray}) > 0) {
            $self->{logUtil}->putF("Image Available", $self, $self->{PROCESS_DATA_WORKER_RESULTS});
            $self->setFrame($keyArray->[scalar(@{$keyArray}) - 1]);
            if ($self->getFrame() > $self->{lastFrame}) {
                $self->{logUtil}->putF("Processing new frame: " . $self->getFrame(), $self, $self->{PROCESS_DATA_WORKER_RESULTS});
                my $hashMap = $self->getGenericProfile()->getGenericProfileActions()->getHashMap();
                my $set = $hashMap->keySet();
                $self->{logUtil}->putF("Processing " . $set->size() . "Actions", $self, $self->{PROCESS_DATA_WORKER_RESULTS});
                my $actionNameArray = $set->toArray();
                my $size = scalar(@{$actionNameArray});
                for (my $index = 0; $index < $size; $index++) {
                    my $actionNameString = $actionNameArray->[$index];
                    $self->{logUtil}->putF("Processing Action: " . $actionNameString, $self, $self->{PROCESS_DATA_WORKER_RESULTS});
                    my $genericProfileAction = $hashMap->get($actionNameString);
                    my $genericProfileActionScript = $genericProfileAction->getGenericProfileActionScript();
                    my $vector = $genericProfileActionScript->getProfileActionConditionInterfaceVector();
                    'org::allbinary::input::automation::module::generic::CaptureWorkerUtil'->processProfileActionConditions($vector, $self->getFrame());
                }
                $self->{lastFrame} = $self->getFrame();
            }
        } else {
            $self->{logUtil}->putF("Image Not Available", $self, $self->{PROCESS_DATA_WORKER_RESULTS});
        }
}


# throws Exception
sub process {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{PROCESS});
        $self->startDataWorkers();
        $self->processDataWorkerResults();
}


sub getGenericProfile {
    my ($self) = @_;
        return $self->{genericProfile};
}


sub setGenericProfile {
    my ($self, $genericProfile) = @_;
        $self->{genericProfile} = $genericProfile;
}


sub getFrame {
    my ($self) = @_;
        return $self->{frame};
}


sub setFrame {
    my ($self, $frame) = @_;
        $self->{frame} = $frame;
}

use java::util::HashMap;
# use java::util::Set;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::input::automation::module::AbstractInputAutomationWorker;
use org::allbinary::input::automation::module::InputAutomationActionInterface;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfile;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileAction;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::script::GenericProfileActionScript;
use org::allbinary::input::media::image::capture::CapturedBufferedImagesCacheSingleton;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::util::cache::J2SECacheInterface;
use org::allbinary::media::image::comparison::ImageComparatorConstraintsInterface;
use org::allbinary::media::image::comparison::ImageComparisonWorker;
use org::allbinary::media::image::comparison::motion::MotionRectangleConstraintsInterface;
use org::allbinary::media::image::comparison::motion::MotionRectanglesWorker;
use org::allbinary::input::automation::module::generic::GenericProfileCaptureWorkerFactory;
use org::allbinary::input::automation::module::generic::CaptureWorkerUtil;

1;

