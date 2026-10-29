# Generated Code Do Not Modify

package org::allbinary::layer::LayerManager;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{systemWrapper} = 'org::allbinary::logic::ABSystemWrapper'->getInstance();
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
    $self->{layerManagerLogging} = undef;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{anyType} = 'org::allbinary::thread::SynchObject'->new();
}


sub new {
    my ($class, $layerManagerLogging) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->{layerManagerLogging} = $layerManagerLogging;
    return $self;
}


sub contains {
    my ($self, $layerInterface) = @_;
        return $self->{list}->contains($layerInterface);
}


# throws Exception
sub update {
    my ($self, $layerInterface) = @_;
        my $had = $self->{list}->remove($layerInterface);
        if ($had) {
            my $nextLayerInterface = undef;
            my $size = $self->{list}->size();
            for (my $index = 0; $index < $size; $index++) {
                $nextLayerInterface = $self->{list}->get($index);
                if ($layerInterface->getZP() > $nextLayerInterface->getZP()) {
                    $self->{list}->addAt($index, $layerInterface);
                    return;
                }
            }
            $self->{list}->add($layerInterface);
        }
}


# throws Exception
sub insert {
    my ($self, $layerInterface) = @_;
        my $nextLayerInterface = undef;
        my $size = $self->{list}->size();
        for (my $index = 0; $index < $size; $index++) {
            $nextLayerInterface = $self->{list}->get($index);
            if ($layerInterface->getZP() > $nextLayerInterface->getZP()) {
                $self->appendAt($layerInterface, $index);
                return;
            }
        }
        $self->append($layerInterface);
}


# throws Exception
sub append {
    my ($self, $layerInterface) = @_;
        $self->{layerManagerLogging}->append($layerInterface);
        $self->{list}->add($layerInterface);
}


# throws Exception
sub appendAt {
    my ($self, $layerInterface, $index) = @_;
        $self->{layerManagerLogging}->appendAt($layerInterface, $index);
        $self->{list}->addAt($index, $layerInterface);
}


# throws Exception
sub remove {
    my ($self, $layerInterface) = @_;
        { # synchronized ($self->{anyType})
            $self->{layerManagerLogging}->remove($layerInterface);
            my $result = $self->{list}->remove($layerInterface);
            $self->{layerManagerLogging}->removeResult($self, $layerInterface, $result);
        }
}


sub getLayerAt {
    my ($self, $index) = @_;
        return $self->{list}->{objectArray}->[$index];
}


sub getSize {
    my ($self) = @_;
        return $self->{list}->size();
}


# throws Exception
sub cleanup {
    my ($self) = @_;
        { # synchronized ($self->{anyType})
            $self->{list}->clear();
            $self->{layerManagerLogging}->clear();
            $self->{tsUtil}->gc();
            $self->{tsUtil}->gc();
        }
}


sub paint {
    my ($self, $g, $x, $y) = @_;
        { # synchronized ($self->{anyType})
            my $comp = undef;
            for (my $index = $self->{list}->size(); --$index >= 0; ) {
                $comp = $self->{list}->{objectArray}->[$index];
                if (defined($comp) && $comp->isVisible()) {
                    $comp->paint($g);
                }
            }
        }
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::TsUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::thread::SynchObject;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::ABSystemWrapper;

1;

