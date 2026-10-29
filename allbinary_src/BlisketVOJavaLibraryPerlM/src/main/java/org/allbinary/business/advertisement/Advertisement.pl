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

package org::allbinary::business::advertisement::Advertisement;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::advertisement::AdvertisementInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{artist} = undef;
    $self->{artistLink} = undef;
    $self->{title} = undef;
    $self->{dateAdded} = undef;
    $self->{directory} = undef;
    $self->{framedLink} = undef;
    $self->{rank} = 0;
    $self->{listPrice} = undef;
    $self->{ourPrice} = undef;
    $self->{image} = undef;
    $self->{product} = undef;
    $self->{thumbnail} = undef;
    $self->{displayInBrowserContraintsInterface} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{displayInBrowserContraintsInterface} = undef;
    return $self;
}


sub getArtist {
    my ($self) = @_;
        return $self->{artist};
}


sub setArtist {
    my ($self, $artist) = @_;
        $self->{artist} = $artist;
}


sub getArtistLink {
    my ($self) = @_;
        return $self->{artistLink};
}


sub setArtistLink {
    my ($self, $artistLink) = @_;
        $self->{artistLink} = $artistLink;
}


sub getTitle {
    my ($self) = @_;
        return $self->{title};
}


sub setTitle {
    my ($self, $title) = @_;
        $self->{title} = $title;
}


sub getDateAdded {
    my ($self) = @_;
        return $self->{dateAdded};
}


sub setDateAdded {
    my ($self, $dateAdded) = @_;
        $self->{dateAdded} = $dateAdded;
}


sub getDirectory {
    my ($self) = @_;
        return $self->{directory};
}


sub setDirectory {
    my ($self, $directory) = @_;
        $self->{directory} = $directory;
}


sub getFramedLink {
    my ($self) = @_;
        return $self->{framedLink};
}


sub setFramedLink {
    my ($self, $framedLink) = @_;
        $self->{framedLink} = $framedLink;
}


sub getListPrice {
    my ($self) = @_;
        return $self->{listPrice};
}


sub setListPrice {
    my ($self, $listPrice) = @_;
        $self->{listPrice} = $listPrice;
}


sub getOurPrice {
    my ($self) = @_;
        return $self->{ourPrice};
}


sub setOurPrice {
    my ($self, $ourPrice) = @_;
        $self->{ourPrice} = $ourPrice;
}


sub getRank {
    my ($self) = @_;
        return $self->{rank};
}


sub setRank {
    my ($self, $rank) = @_;
        $self->{rank} = $rank;
}


sub getImage {
    my ($self) = @_;
        return $self->{image};
}


sub setImage {
    my ($self, $image) = @_;
        $self->{image} = $image;
}


sub getProduct {
    my ($self) = @_;
        return $self->{product};
}


sub setProduct {
    my ($self, $product) = @_;
        $self->{product} = $product;
}


sub getThumbnail {
    my ($self) = @_;
        return $self->{thumbnail};
}


sub setThumbnail {
    my ($self, $thumbnail) = @_;
        $self->{thumbnail} = $thumbnail;
}


sub getDisplayInBrowserContraintsInterface {
    my ($self) = @_;
        return $self->{displayInBrowserContraintsInterface};
}

use org::allbinary::business::advertisement::image::AdvertisementImageInterface;
use org::allbinary::business::advertisement::product::AdvertisementProductInterface;
use org::allbinary::business::advertisement::thumbnail::AdvertisementThumbnailInterface;
use org::allbinary::business::user::commerce::money::Money;
use org::allbinary::logic::control::contraints::display::browser::DisplayInBrowserContraintsInterface;
use org::allbinary::business::advertisement::AdvertisementInterface;

1;

