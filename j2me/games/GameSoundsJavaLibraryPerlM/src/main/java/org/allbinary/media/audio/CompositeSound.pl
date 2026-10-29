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

package org::allbinary::media::audio::CompositeSound;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::audio::Sound';



sub new {
    my ($class, $resource) = @_;
    my $self = $class->SUPER::new($resource);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub init {
    my ($self) = @_;
        $self->setPlayerP('org::allbinary::media::audio::PlayerComposite'->new('org::allbinary::media::audio::AllBinaryMediaManager'->createPlayer($self->getResource()), 570));
}

use org::allbinary::media::audio::Sound;
use org::allbinary::media::audio::PlayerComposite;
use org::allbinary::media::audio::AllBinaryMediaManager;

1;

