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

package org::allbinary::game::displayable::canvas::PreGameLockablePaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::LockablePaintable';


sub _init_fields {
    my ($self) = @_;
    $self->{halfWidth} = undef;
    $self->{paintableForm} = undef;
}


sub new {
    my ($class, $paintableForm, $lockedIndex) = @_;
    my $self = $class->SUPER::new($lockedIndex);
    $self->_init_fields();
        # super(...) made $self above
        $self->{paintableForm} = $paintableForm;
        $self->{halfWidth} = 'org::allbinary::image::GameFeatureImageCacheFactory'->getInstance()->getWithKey('org::allbinary::logic::system::security::licensing::LockedResources'->getInstance()->{LOCKED_DEMO_GAME_FEATURE_RESOURCE})->getWidth() / 2;
    return $self;
}


sub paint {
    my ($self, $graphics, $currentIndex, $x, $y) = @_;
        if ('org::allbinary::logic::system::security::licensing::LockedUtil'->getInstance()->isLocked() && $self->getPaintableForm()->getSelectedIndex() >= $self->getLockedIndex()) {
            $self->getAnimation()->paintXY($graphics, $self->getPaintableForm()->getDx() - $self->{halfWidth}, $self->getPaintableForm()->getDy() + 34);
        }
}


sub getPaintableForm {
    my ($self) = @_;
        return $self->{paintableForm};
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::image::GameFeatureImageCacheFactory;
use org::allbinary::logic::system::security::licensing::LockedResources;
use org::allbinary::logic::system::security::licensing::LockedUtil;
use org::allbinary::graphics::form::LockablePaintable;
use org::allbinary::graphics::form::ScrollCurrentSelectionForm;

1;

