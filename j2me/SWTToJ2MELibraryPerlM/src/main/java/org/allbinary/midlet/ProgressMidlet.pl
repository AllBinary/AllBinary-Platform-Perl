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

#SWTForJ2ME
package org::allbinary::midlet::ProgressMidlet;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::midlet::AllBinaryMidlet';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{abeClientInformation} = undef;
}


sub new {
    my ($class, $clientInformationFactory) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->preInit();
        $self->{abeClientInformation} = $clientInformationFactory->getInstance();
    return $self;
}


sub preInit {
    my ($self) = @_;
}


sub exitProgress {
    my ($self, $isProgress) = @_;
        my $processor = 'org::allbinary::midlet::MidletExitProcessorFactory'->getInstance()->getExitInstance($self);
        try {
            my $primaryThreadPool = 'org::allbinary::thread::PrimaryThreadPool'->getInstance();
            my $runnable = 'org::allbinary::midlet::ExitRunnable'->new($self, $processor, $isProgress);
            $primaryThreadPool->runTask($runnable);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "exit", $e);
            try {
                $processor->process();
            } catch ($e2) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "exit", $e);
            }
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::canvas::Processor;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ClientInformationFactory;
use org::allbinary::thread::PrimaryThreadPool;
use org::allbinary::thread::ThreadPool;
use org::allbinary::midlet::AllBinaryMidlet;
use org::allbinary::midlet::MidletExitProcessorFactory;
use org::allbinary::midlet::ExitRunnable;

1;

