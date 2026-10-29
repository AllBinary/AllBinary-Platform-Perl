# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::device::NullGL10;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::khronos::opengles::GL10';

our $NULL_GL10 = 'org::allbinary::device::NullGL10'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub glActiveTexture {
    my ($self, $texture) = @_;
        return;
}


sub glAlphaFunc {
    my ($self, $func, $ref) = @_;
        return;
}


sub glBindTexture {
    my ($self, $target, $texture) = @_;
        return;
}


sub glBlendFunc {
    my ($self, $sfactor, $dfactor) = @_;
        return;
}


sub glClear {
    my ($self, $mask) = @_;
        return;
}


sub glClearColor {
    my ($self, $red, $green, $blue, $alpha) = @_;
        return;
}


sub glClearDepthf {
    my ($self, $depth) = @_;
        return;
}


sub glClearStencil {
    my ($self, $s) = @_;
        return;
}


sub glClientActiveTexture {
    my ($self, $texture) = @_;
        return;
}


sub glColor4f {
    my ($self, $red, $green, $blue, $alpha) = @_;
        return;
}


sub glColorMask {
    my ($self, $red, $green, $blue, $alpha) = @_;
        return;
}


sub glColorPointer {
    my ($self, $size, $type, $stride, $pointer) = @_;
        return;
}


sub glCompressedTexImage2D {
    my ($self, $target, $level, $internalformat, $width, $height, $border, $imageSize, $data) = @_;
        return;
}


sub glCompressedTexSubImage2D {
    my ($self, $target, $level, $xoffset, $yoffset, $width, $height, $format, $imageSize, $data) = @_;
        return;
}


sub glCopyTexImage2D {
    my ($self, $target, $level, $internalformat, $x, $y, $width, $height, $border) = @_;
        return;
}


sub glCopyTexSubImage2D {
    my ($self, $target, $level, $xoffset, $yoffset, $x, $y, $width, $height) = @_;
        return;
}


sub glCullFace {
    my ($self, $mode) = @_;
        return;
}


sub glDeleteTextures {
    my ($self, $n, $textures, $offset) = @_;
        return;
}


# Java overloaded method: Perl keeps the last definition
sub glDeleteTextures {
    my ($self, $n, $textures) = @_;
        return;
}


sub glDepthFunc {
    my ($self, $func) = @_;
        return;
}


sub glDepthMask {
    my ($self, $flag) = @_;
        return;
}


sub glDepthRangef {
    my ($self, $zNear, $zFar) = @_;
        return;
}


sub glDisable {
    my ($self, $cap) = @_;
        return;
}


sub glDisableClientState {
    my ($self, $array) = @_;
        return;
}


sub glDrawArrays {
    my ($self, $mode, $first, $count) = @_;
        return;
}


sub glDrawElements {
    my ($self, $mode, $count, $type, $indices) = @_;
        return;
}


sub glEnable {
    my ($self, $cap) = @_;
        return;
}


sub glEnableClientState {
    my ($self, $array) = @_;
        return;
}


sub glFinish {
    my ($self) = @_;
        return;
}


sub glFlush {
    my ($self) = @_;
        return;
}


sub glFogf {
    my ($self, $pname, $param) = @_;
        return;
}


sub glFogfv {
    my ($self, $pname, $params, $offset) = @_;
        return;
}


# Java overloaded method: Perl keeps the last definition
sub glFogfv {
    my ($self, $pname, $params) = @_;
        return;
}


sub glFrontFace {
    my ($self, $mode) = @_;
        return;
}


sub glFrustumf {
    my ($self, $left, $right, $bottom, $top, $zNear, $zFar) = @_;
        return;
}


sub glGenTextures {
    my ($self, $n, $textures, $offset) = @_;
        return;
}


# Java overloaded method: Perl keeps the last definition
sub glGenTextures {
    my ($self, $n, $textures) = @_;
        return;
}


sub glGetError {
    my ($self) = @_;
        return 0;
}


sub glGetIntegerv {
    my ($self, $pname, $params, $offset) = @_;
        return;
}


# Java overloaded method: Perl keeps the last definition
sub glGetIntegerv {
    my ($self, $pname, $params) = @_;
        return;
}


sub glGetString {
    my ($self, $name) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub glHint {
    my ($self, $target, $mode) = @_;
        return;
}


sub glLightModelf {
    my ($self, $pname, $param) = @_;
        return;
}


sub glLightModelfv {
    my ($self, $pname, $params, $offset) = @_;
        return;
}


# Java overloaded method: Perl keeps the last definition
sub glLightModelfv {
    my ($self, $pname, $params) = @_;
        return;
}


sub glLightf {
    my ($self, $light, $pname, $param) = @_;
        return;
}


sub glLightfv {
    my ($self, $light, $pname, $params, $offset) = @_;
        return;
}


# Java overloaded method: Perl keeps the last definition
sub glLightfv {
    my ($self, $light, $pname, $params) = @_;
        return;
}


sub glLineWidth {
    my ($self, $width) = @_;
        return;
}


sub glLoadIdentity {
    my ($self) = @_;
        return;
}


sub glLoadMatrixf {
    my ($self, $m, $offset) = @_;
        return;
}


# Java overloaded method: Perl keeps the last definition
sub glLoadMatrixf {
    my ($self, $m) = @_;
        return;
}


sub glLogicOp {
    my ($self, $opcode) = @_;
        return;
}


sub glMaterialf {
    my ($self, $face, $pname, $param) = @_;
        return;
}


sub glMaterialfv {
    my ($self, $face, $pname, $params, $offset) = @_;
        return;
}


# Java overloaded method: Perl keeps the last definition
sub glMaterialfv {
    my ($self, $face, $pname, $params) = @_;
        return;
}


sub glMatrixMode {
    my ($self, $mode) = @_;
        return;
}


sub glMultMatrixf {
    my ($self, $m, $offset) = @_;
        return;
}


# Java overloaded method: Perl keeps the last definition
sub glMultMatrixf {
    my ($self, $m) = @_;
        return;
}


sub glMultiTexCoord4f {
    my ($self, $target, $s, $t, $r, $q) = @_;
        return;
}


sub glNormal3f {
    my ($self, $nx, $ny, $nz) = @_;
        return;
}


sub glNormalPointer {
    my ($self, $type, $stride, $pointer) = @_;
        return;
}


sub glOrthof {
    my ($self, $left, $right, $bottom, $top, $zNear, $zFar) = @_;
        return;
}


sub glPixelStorei {
    my ($self, $pname, $param) = @_;
        return;
}


sub glPointSize {
    my ($self, $size) = @_;
        return;
}


sub glPolygonOffset {
    my ($self, $factor, $units) = @_;
        return;
}


sub glPopMatrix {
    my ($self) = @_;
        return;
}


sub glPushMatrix {
    my ($self) = @_;
        return;
}


sub glReadPixels {
    my ($self, $x, $y, $width, $height, $format, $type, $pixels) = @_;
        return;
}


sub glRotatef {
    my ($self, $angle, $x, $y, $z) = @_;
        return;
}


sub glRotatex {
    my ($self, $angle, $x, $y, $z) = @_;
        return;
}


sub glSampleCoverage {
    my ($self, $value, $invert) = @_;
        return;
}


sub glScalef {
    my ($self, $x, $y, $z) = @_;
        return;
}


sub glScalex {
    my ($self, $x, $y, $z) = @_;
        return;
}


sub glScissor {
    my ($self, $x, $y, $width, $height) = @_;
        return;
}


sub glShadeModel {
    my ($self, $mode) = @_;
        return;
}


sub glStencilFunc {
    my ($self, $func, $ref, $mask) = @_;
        return;
}


sub glStencilMask {
    my ($self, $mask) = @_;
        return;
}


sub glStencilOp {
    my ($self, $fail, $zfail, $zpass) = @_;
        return;
}


sub glTexCoordPointer {
    my ($self, $size, $type, $stride, $pointer) = @_;
        return;
}


sub glTexEnvf {
    my ($self, $target, $pname, $param) = @_;
        return;
}


sub glTexEnvfv {
    my ($self, $target, $pname, $params, $offset) = @_;
        return;
}


# Java overloaded method: Perl keeps the last definition
sub glTexEnvfv {
    my ($self, $target, $pname, $params) = @_;
        return;
}


sub glTexImage2D {
    my ($self, $target, $level, $internalformat, $width, $height, $border, $format, $type, $pixels) = @_;
        return;
}


sub glTexParameterf {
    my ($self, $target, $pname, $param) = @_;
        return;
}


sub glTexParameteri {
    my ($self, $target, $pname, $param) = @_;
        return;
}


sub glTexSubImage2D {
    my ($self, $target, $level, $xoffset, $yoffset, $width, $height, $format, $type, $pixels) = @_;
        return;
}


sub glTranslatef {
    my ($self, $x, $y, $z) = @_;
        return;
}


sub glVertexPointer {
    my ($self, $size, $type, $stride, $pointer) = @_;
        return;
}


sub glViewport {
    my ($self, $x, $y, $width, $height) = @_;
        return;
}


sub glBegin {
    my ($self, $i) = @_;
        return;
}


sub glEnd {
    my ($self) = @_;
        return;
}


sub glVertex3f {
    my ($self, $f, $f2, $f3) = @_;
        return;
}


sub glPolygonMode {
    my ($self, $i, $i1) = @_;
        return;
}

# use javax::microedition::khronos::opengles::GL10;
# use java::nio::Buffer;
# use java::nio::FloatBuffer;
# use java::nio::IntBuffer;
use org::allbinary::logic::string::StringUtil;

1;

