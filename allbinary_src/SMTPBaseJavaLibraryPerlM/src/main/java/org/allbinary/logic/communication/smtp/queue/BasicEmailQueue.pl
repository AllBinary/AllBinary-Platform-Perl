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

package org::allbinary::logic::communication::smtp::queue::BasicEmailQueue;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::queue::BasicQueue','org::allbinary::logic::communication::smtp::queue::EmailQueueInterface';

our $instance = 'org::allbinary::logic::communication::smtp::queue::BasicEmailQueue'->new();
our $basicEmailQueue = undef;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        if (!defined($org::allbinary::logic::communication::smtp::queue::BasicEmailQueue::basicEmailQueue)) {
            $org::allbinary::logic::communication::smtp::queue::BasicEmailQueue::basicEmailQueue = 'org::allbinary::logic::communication::smtp::queue::BasicEmailQueue'->new();
        }
        return $org::allbinary::logic::communication::smtp::queue::BasicEmailQueue::basicEmailQueue;
}


# throws Exception
sub offer {
    my ($self, $emailInterface) = @_;
        $self->offer($emailInterface);
        $self->post($emailInterface);
        return 1;
}


sub remove {
    my ($self, $emailInterface) = @_;
        $self->remove($emailInterface);
}


# Java overloaded method: Perl keeps the last definition
sub remove {
    my ($self) = @_;
        return undef;
}


# throws Exception
sub post {
    my ($self, $emailInterface) = @_;
        if ($self->send($emailInterface)) {
            $self->remove($emailInterface);
            $self->processAllUnsent();
        }
}


# throws Exception
sub processAllUnsent {
    my ($self) = @_;
        my $size = $self->{queueVector}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $emailInterface = $self->{queueVector}->get($index);
            if ($self->send($emailInterface)) {
                $self->remove($emailInterface);
                $self->processAllUnsent();
            }
        }
}


sub send {
    my ($self, $emailInterface) = @_;
        try {
            if ($org::allbinary::logic::communication::smtp::queue::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::queue::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
                $self->{logUtil}->putF("Sending: " . $emailInterface->log(), $self, "send");
            }
            'javax::mail::Transport'->send($emailInterface->getMimeMessage());
            if ($org::allbinary::logic::communication::smtp::queue::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::queue::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
                $self->{logUtil}->putF("Email Send Debug: " . $emailInterface->getDebugInfo(), $self, "send");
            }
            return 1;
        } catch ($e) {
            if ($org::allbinary::logic::communication::smtp::queue::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::queue::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
                $self->{logUtil}->put("Failed Email Send Debug: " . $emailInterface->getDebugInfo(), $self, "send", $e);
            }
            return 0;
        }
}

# use javax::mail::Transport;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::EmailInterface;
use org::allbinary::logic::util::queue::BasicQueue;
use org::allbinary::logic::communication::smtp::queue::EmailQueueInterface;

1;

