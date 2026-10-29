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

package org::allbinary::input::automation::module::generic::configuration::profile::SavedCaptureGenericProfileDataWorkerType;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType';

our $SAVED_CAPTURE = 'org::allbinary::input::automation::module::generic::configuration::profile::SavedCaptureGenericProfileDataWorkerType'->new("Saved " . $org::allbinary::input::media::image::InputImageType::CAPTURE->getName(), "c:\\share\\captures\\2\\", 100);

sub _init_fields {
    my ($self) = @_;
    $self->{path} = undef;
    $self->{lastFrame} = 0;
}


sub new {
    my ($class, $name, $path, $lastFrame) = @_;
    my $self = $class->SUPER::new($name);
    $self->_init_fields();
        # super(...) made $self above
        $self->setPath($path);
        $self->setLastFrame($lastFrame);
    return $self;
}


sub getPath {
    my ($self) = @_;
        return $self->{path};
}


sub setPath {
    my ($self, $path) = @_;
        $self->{path} = $path;
}


sub getLastFrame {
    my ($self) = @_;
        return $self->{lastFrame};
}


sub setLastFrame {
    my ($self, $lastFrame) = @_;
        $self->{lastFrame} = $lastFrame;
}

use org::allbinary::input::media::image::InputImageType;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileDataWorkerType;

1;

