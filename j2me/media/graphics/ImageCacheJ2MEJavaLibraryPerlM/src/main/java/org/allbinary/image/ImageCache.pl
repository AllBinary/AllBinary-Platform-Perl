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

package org::allbinary::image::ImageCache;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::image::ImageCacheBase';

our $NULL_IMAGE_CACHE = 'org::allbinary::image::ImageCache'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub addListener {
    my ($self, $renderer) = @_;
}


sub getIndex {
    my ($self, $key) = @_;
        my $gdResources = 'org::allbinary::game::gd::resource::GDResources'->getInstance();
        my $resourceStringArray = $gdResources->{resourceStringArray};
        my $size = scalar(@{$resourceStringArray});
        for (my $index = 0; $index < $size; $index++) {
            if ($resourceStringArray->[$index] == $key) {
                return $index;
            }
        }
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("unable to find key: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($key))->toString(), $self, $self->{commonStrings}->{RUN});
        die ("RuntimeException");
}


# throws Exception
sub get {
    my ($self, $caller, $width, $height) = @_;
        my $foundIndex = $self->getIndexWH($width, $height);
        my $image = $self->getFromAvailable($foundIndex, $width, $height);
        if ($image == $javax::microedition::lcdui::NullImage::NULL_IMAGE) {
            $self->{volume} += $width * $height;
            if ($self->{volume} > 32000) {
                $self->{tsUtil}->gc();
                $self->{volume} = 0;
            }
            $image = $self->createImage($caller, $width, $height);
            my $widths = $self->{widths};
            if ($self->{nextIndex} > scalar(@{$widths}) - 1) {
                if ($foundIndex == -1) {
                    $foundIndex = $self->{nextIndex};
                    $widths->[$self->{nextIndex}] = $width;
                    $self->{heights}->[$self->{nextIndex}] = $height;
                    $self->{nextIndex}++;
                }
                $self->{listOfList}->[$foundIndex]->add($image);
            }
        }
        return $image;
}


# throws Exception
sub getWithKey {
    my ($self, $key) = @_;
        my $image = $self->getImage($key);
        if ($image == $javax::microedition::lcdui::NullImage::NULL_IMAGE) {
            my $resourceUtil = 'org::allbinary::data::resource::ResourceUtil'->getInstance();
            my $resourceInputStream = $resourceUtil->getResourceAsStream($key);
            if (!defined($resourceInputStream)) {
                die ('org::allbinary::logic::string::StringMaker'->new()->append("Image resource is not available for key: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($key))->toString());
            }
            try {
                $image = $self->createImageFromInputStream($key, $resourceInputStream);
            } catch ($e) {
                $self->{logUtil}->put("Exception: Trying Again After GC", $self, $self->{commonStrings}->{GET}, $e);
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("InputStream: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($resourceInputStream))->toString(), $self, $self->{commonStrings}->{GET});
                $self->{tsUtil}->gc();
                $self->{tsUtil}->gc();
                $self->{logUtil}->putF('org::allbinary::system::Memory'->getInfo(), $self, $self->{commonStrings}->{GET});
                Time::HiRes::sleep((100) / 1000);
                $image = $self->createImageFromInputStream($key, $resourceInputStream);
            }
            if ('org::allbinary::J2MEUtil'->isHTML()) {
            } else {
                $resourceInputStream->close();
            }
            $self->{hashtable}->put($key, $image);
        }
        return $image;
}


# throws Exception
sub loadImageForAnimation {
    my ($self) = @_;
}


sub progressEnded {
    my ($self) = @_;
}


sub runTask {
    my ($self) = @_;
}


sub isLazy {
    my ($self) = @_;
        return 0;
}

# use java::io::InputStream;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::J2MEUtil;
use org::allbinary::TsUtil;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::game::gd::resource::GDResources;
use org::allbinary::logic::ABSystemWrapper;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::system::Memory;
use org::allbinary::image::ImageCacheBase;
use java::lang::Thread;

1;

