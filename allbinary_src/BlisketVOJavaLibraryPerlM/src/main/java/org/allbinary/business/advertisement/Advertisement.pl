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
use parent -norequire,'java::lang::Object','org::allbinary::business::advertisement::AdvertisementInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{artist} = undef unless exists $self->{artist};
    $self->{artistLink} = undef unless exists $self->{artistLink};
    $self->{title} = undef unless exists $self->{title};
    $self->{dateAdded} = undef unless exists $self->{dateAdded};
    $self->{directory} = undef unless exists $self->{directory};
    $self->{framedLink} = undef unless exists $self->{framedLink};
    $self->{rank} = 0 unless exists $self->{rank};
    $self->{listPrice} = undef unless exists $self->{listPrice};
    $self->{ourPrice} = undef unless exists $self->{ourPrice};
    $self->{image} = undef unless exists $self->{image};
    $self->{product} = undef unless exists $self->{product};
    $self->{thumbnail} = undef unless exists $self->{thumbnail};
    $self->{displayInBrowserContraintsInterface} = undef unless exists $self->{displayInBrowserContraintsInterface};
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
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

use java::lang::Object ();
use org::allbinary::business::advertisement::image::AdvertisementImageInterface ();
use org::allbinary::business::advertisement::product::AdvertisementProductInterface ();
use org::allbinary::business::advertisement::thumbnail::AdvertisementThumbnailInterface ();
use org::allbinary::business::user::commerce::money::Money ();
use org::allbinary::logic::control::contraints::display::browser::DisplayInBrowserContraintsInterface ();
use org::allbinary::business::advertisement::AdvertisementInterface ();

1;

