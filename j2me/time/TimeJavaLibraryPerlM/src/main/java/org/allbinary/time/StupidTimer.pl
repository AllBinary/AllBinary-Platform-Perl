# Generated Code Do Not Modify

package org::allbinary::time::StupidTimer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{nullUtil} = 'org::allbinary::logic::NullUtil'->getInstance();
    $self->{threadObjectUtil} = 'org::allbinary::thread::ThreadObjectUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub visitBool {
    my ($self, $visitorInterface) = @_;
        my $result = $visitorInterface->visit($self->{nullUtil}->{NULL_OBJECT});
        my $result2 = $result;
        return $result2;
}


# throws Exception
sub visit {
    my ($self, $visitorInterface, $timeDelayHelper) = @_;
        my $tookTooLong = 0;
        my $WAITING_FOR = "Waiting for: ";
        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($WAITING_FOR)->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($visitorInterface))->toString(), $self, $self->{commonStrings}->{VISIT});
        my $index = 0;
        while ($self->visitBool($visitorInterface)) {
            if ($index % 10 == 0) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($WAITING_FOR)->appendint($index)->toString(), $self, $self->{commonStrings}->{VISIT});
            }
            $index++;
            { # synchronized ($self)
                $self->{threadObjectUtil}->waitObjectFor($self, 1800);
            }
            if ($timeDelayHelper->isTimeTNT()) {
                $tookTooLong = 1;
                last;
            }
        }
        if ($tookTooLong) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{VISIT}, ('org::allbinary::logic::string::StringMaker'->new()->append("Took Too Long: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($visitorInterface))->toString()));
        } else {
            'org::allbinary::logic::communication::log::PreLogUtil'->put($timeDelayHelper->toString(), $self, $self->{commonStrings}->{VISIT});
        }
}


# throws Exception
sub stopWaiting {
    my ($self) = @_;
        { # synchronized ($self)
            $self->{threadObjectUtil}->notifyObject($self);
        }
}

use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::visitor::Visitor;
use org::allbinary::string::CommonStrings;
use org::allbinary::thread::ThreadObjectUtil;

1;

