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

package org::allbinary::image::ImageCacheBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{imageFactory} = 'org::allbinary::image::ImageFactory'->getInstance();
    $self->{hashtable} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
    $self->{SIZE} = 128;
    $self->{widths} = [(0) x ($self->{SIZE})];
    $self->{heights} = [(0) x ($self->{SIZE})];
    $self->{listOfList} = [(undef) x ($self->{SIZE})];
    $self->{availableListOfList} = [(undef) x ($self->{SIZE})];
    $self->{volume} = 0;
    $self->{nextIndex} = 0;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        for (my $index = scalar(@{$self->{listOfList}}) - 1; $index >= 0; $index--) {
            $self->{listOfList}->[$index] = 'org::allbinary::util::BasicArrayListD'->new();
        }
        for (my $index = scalar(@{$self->{availableListOfList}}) - 1; $index >= 0; $index--) {
            $self->{availableListOfList}->[$index] = 'org::allbinary::util::BasicArrayListD'->new();
        }
    return $self;
}


sub getImage {
    my ($self, $resourceId) = @_;
        my $imageCanBeNull = $self->{hashtable}->get($resourceId);
        if (!defined($imageCanBeNull)) {
            return $javax::microedition::lcdui::NullImage::NULL_IMAGE;
        }
        return $imageCanBeNull;
}


sub releaseAll {
    my ($self) = @_;
        for (my $index = scalar(@{$self->{listOfList}}) - 1; $index >= 0; $index--) {
            $self->{availableListOfList}->[$index]->clear();
            $self->{availableListOfList}->[$index]->addAllList($self->{listOfList}->[$index]);
        }
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("ImageCache: ")->append($self->toString())->toString(), $self, "releaseAll");
}


sub getIndexWH {
    my ($self, $width, $height) = @_;
        my $foundIndex = -1;
        my $size = scalar(@{$self->{widths}});
        for (my $index = 0; $index < $size; $index++) {
            if ($self->{widths}->[$index] == $width && $self->{heights}->[$index] == $height) {
                $foundIndex = $index;
                return $foundIndex;
            }
        }
        return $foundIndex;
}


sub getFromAvailable {
    my ($self, $foundIndex, $width, $height) = @_;
        if ($foundIndex != -1) {
            if ($self->{availableListOfList}->[$foundIndex]->size() > 0) {
                my $list = $self->{availableListOfList}->[$foundIndex];
                return $list->removeAt($list->size() - 1);
            }
        }
        return $javax::microedition::lcdui::NullImage::NULL_IMAGE;
}


# throws Exception
sub get {
    my ($self, $caller, $width, $height) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getWithKey {
    my ($self, $key) = @_;
        die ("RuntimeException");
}


# throws Exception
sub createImage {
    my ($self, $caller, $width, $height) = @_;
        return $self->{imageFactory}->createImage($caller, $width, $height);
}


# throws Exception
sub createImageFromInputStream {
    my ($self, $key, $inputStream) = @_;
        return $self->{imageFactory}->createImageFromInputStream($key, $inputStream);
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        for (my $index = $self->{nextIndex} - 1; $index >= 0; $index--) {
            my $width = $self->{widths}->[$index];
            my $height = $self->{heights}->[$index];
            my $total = $self->{listOfList}->[$index]->size();
            my $totalAvailable = $self->{availableListOfList}->[$index]->size();
            $stringBuffer->append(" w: ");
            $stringBuffer->appendint($width);
            $stringBuffer->append(" h: ");
            $stringBuffer->appendint($height);
            $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
            $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{TOTAL_LABEL});
            $stringBuffer->appendint($total);
            $stringBuffer->append(" available: ");
            $stringBuffer->appendint($totalAvailable);
        }
        return $stringBuffer->toString();
}


sub getHashtableP {
    my ($self) = @_;
        return $self->{hashtable};
}


sub init {
    my ($self, $image) = @_;
}


sub initProgress {
    my ($self) = @_;
}

# use java::io::InputStream;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::image::ImageFactory;

1;

