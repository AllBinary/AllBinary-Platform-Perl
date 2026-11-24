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
use parent -norequire,'java::lang::Object','javax::microedition::khronos::opengles::GL10';

tie our $NULL_GL10, 'java::lang::LazyStatic', sub { 'org::allbinary::device::NullGL10'->new() };

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


sub glAlphaFuncx {
    my ($self, $func, $ref) = @_;
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


sub glClearColorx {
    my ($self, $red, $green, $blue, $alpha) = @_;
}


sub glClearDepthf {
    my ($self, $depth) = @_;
        return;
}


sub glClearDepthx {
    my ($self, $depth) = @_;
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


sub glColor4x {
    my ($self, $red, $green, $blue, $alpha) = @_;
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


sub glDeleteTextures_j3 {
    my ($self, $n, $textures, $offset) = @_;
        return;
}


sub glDeleteTextures_j2 {
    my ($self, $n, $textures) = @_;
        return;
}

sub glDeleteTextures {
    my ($invocant, @arguments) = @_;
    return $invocant->glDeleteTextures_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->glDeleteTextures_j2(@arguments) if scalar(@arguments) == 2;
    die "No method glDeleteTextures takes " . scalar(@arguments) . " arguments";
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


sub glDepthRangex {
    my ($self, $zNear, $zFar) = @_;
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


sub glFogfv_j3 {
    my ($self, $pname, $params, $offset) = @_;
        return;
}


sub glFogfv_j2 {
    my ($self, $pname, $params) = @_;
        return;
}

sub glFogfv {
    my ($invocant, @arguments) = @_;
    return $invocant->glFogfv_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->glFogfv_j2(@arguments) if scalar(@arguments) == 2;
    die "No method glFogfv takes " . scalar(@arguments) . " arguments";
}


sub glFogx {
    my ($self, $pname, $param) = @_;
}


sub glFogxv_j3 {
    my ($self, $pname, $params, $offset) = @_;
}


sub glFogxv_j2 {
    my ($self, $pname, $params) = @_;
}

sub glFogxv {
    my ($invocant, @arguments) = @_;
    return $invocant->glFogxv_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->glFogxv_j2(@arguments) if scalar(@arguments) == 2;
    die "No method glFogxv takes " . scalar(@arguments) . " arguments";
}


sub glFrontFace {
    my ($self, $mode) = @_;
        return;
}


sub glFrustumf {
    my ($self, $left, $right, $bottom, $top, $zNear, $zFar) = @_;
        return;
}


sub glFrustumx {
    my ($self, $left, $right, $bottom, $top, $zNear, $zFar) = @_;
}


sub glGenTextures_j3 {
    my ($self, $n, $textures, $offset) = @_;
        return;
}


sub glGenTextures_j2 {
    my ($self, $n, $textures) = @_;
        return;
}

sub glGenTextures {
    my ($invocant, @arguments) = @_;
    return $invocant->glGenTextures_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->glGenTextures_j2(@arguments) if scalar(@arguments) == 2;
    die "No method glGenTextures takes " . scalar(@arguments) . " arguments";
}


sub glGetError {
    my ($self) = @_;
        return 0;
}


sub glGetIntegerv_j3 {
    my ($self, $pname, $params, $offset) = @_;
        return;
}


sub glGetIntegerv_j2 {
    my ($self, $pname, $params) = @_;
        return;
}

sub glGetIntegerv {
    my ($invocant, @arguments) = @_;
    return $invocant->glGetIntegerv_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->glGetIntegerv_j2(@arguments) if scalar(@arguments) == 2;
    die "No method glGetIntegerv takes " . scalar(@arguments) . " arguments";
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


sub glLightModelfv_j3 {
    my ($self, $pname, $params, $offset) = @_;
        return;
}


sub glLightModelfv_j2 {
    my ($self, $pname, $params) = @_;
        return;
}

sub glLightModelfv {
    my ($invocant, @arguments) = @_;
    return $invocant->glLightModelfv_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->glLightModelfv_j2(@arguments) if scalar(@arguments) == 2;
    die "No method glLightModelfv takes " . scalar(@arguments) . " arguments";
}


sub glLightModelx {
    my ($self, $pname, $param) = @_;
}


sub glLightModelxv_j3 {
    my ($self, $pname, $params, $offset) = @_;
}


sub glLightModelxv_j2 {
    my ($self, $pname, $params) = @_;
}

sub glLightModelxv {
    my ($invocant, @arguments) = @_;
    return $invocant->glLightModelxv_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->glLightModelxv_j2(@arguments) if scalar(@arguments) == 2;
    die "No method glLightModelxv takes " . scalar(@arguments) . " arguments";
}


sub glLightf {
    my ($self, $light, $pname, $param) = @_;
        return;
}


sub glLightfv_j4 {
    my ($self, $light, $pname, $params, $offset) = @_;
        return;
}


sub glLightfv_j3 {
    my ($self, $light, $pname, $params) = @_;
        return;
}

sub glLightfv {
    my ($invocant, @arguments) = @_;
    return $invocant->glLightfv_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->glLightfv_j3(@arguments) if scalar(@arguments) == 3;
    die "No method glLightfv takes " . scalar(@arguments) . " arguments";
}


sub glLightx {
    my ($self, $light, $pname, $param) = @_;
}


sub glLightxv_j4 {
    my ($self, $light, $pname, $params, $offset) = @_;
}


sub glLightxv_j3 {
    my ($self, $light, $pname, $params) = @_;
}

sub glLightxv {
    my ($invocant, @arguments) = @_;
    return $invocant->glLightxv_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->glLightxv_j3(@arguments) if scalar(@arguments) == 3;
    die "No method glLightxv takes " . scalar(@arguments) . " arguments";
}


sub glLineWidth {
    my ($self, $width) = @_;
        return;
}


sub glLineWidthx {
    my ($self, $width) = @_;
}


sub glLoadIdentity {
    my ($self) = @_;
        return;
}


sub glLoadMatrixf_j2 {
    my ($self, $m, $offset) = @_;
        return;
}


sub glLoadMatrixf_j1 {
    my ($self, $m) = @_;
        return;
}

sub glLoadMatrixf {
    my ($invocant, @arguments) = @_;
    return $invocant->glLoadMatrixf_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->glLoadMatrixf_j1(@arguments) if scalar(@arguments) == 1;
    die "No method glLoadMatrixf takes " . scalar(@arguments) . " arguments";
}


sub glLoadMatrixx_j2 {
    my ($self, $m, $offset) = @_;
}


sub glLoadMatrixx_j1 {
    my ($self, $m) = @_;
}

sub glLoadMatrixx {
    my ($invocant, @arguments) = @_;
    return $invocant->glLoadMatrixx_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->glLoadMatrixx_j1(@arguments) if scalar(@arguments) == 1;
    die "No method glLoadMatrixx takes " . scalar(@arguments) . " arguments";
}


sub glLogicOp {
    my ($self, $opcode) = @_;
        return;
}


sub glMaterialf {
    my ($self, $face, $pname, $param) = @_;
        return;
}


sub glMaterialfv_j4 {
    my ($self, $face, $pname, $params, $offset) = @_;
        return;
}


sub glMaterialfv_j3 {
    my ($self, $face, $pname, $params) = @_;
        return;
}

sub glMaterialfv {
    my ($invocant, @arguments) = @_;
    return $invocant->glMaterialfv_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->glMaterialfv_j3(@arguments) if scalar(@arguments) == 3;
    die "No method glMaterialfv takes " . scalar(@arguments) . " arguments";
}


sub glMaterialx {
    my ($self, $face, $pname, $param) = @_;
}


sub glMaterialxv_j4 {
    my ($self, $face, $pname, $params, $offset) = @_;
}


sub glMaterialxv_j3 {
    my ($self, $face, $pname, $params) = @_;
}

sub glMaterialxv {
    my ($invocant, @arguments) = @_;
    return $invocant->glMaterialxv_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->glMaterialxv_j3(@arguments) if scalar(@arguments) == 3;
    die "No method glMaterialxv takes " . scalar(@arguments) . " arguments";
}


sub glMatrixMode {
    my ($self, $mode) = @_;
        return;
}


sub glMultMatrixf_j2 {
    my ($self, $m, $offset) = @_;
        return;
}


sub glMultMatrixf_j1 {
    my ($self, $m) = @_;
        return;
}

sub glMultMatrixf {
    my ($invocant, @arguments) = @_;
    return $invocant->glMultMatrixf_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->glMultMatrixf_j1(@arguments) if scalar(@arguments) == 1;
    die "No method glMultMatrixf takes " . scalar(@arguments) . " arguments";
}


sub glMultMatrixx_j2 {
    my ($self, $m, $offset) = @_;
}


sub glMultMatrixx_j1 {
    my ($self, $m) = @_;
}

sub glMultMatrixx {
    my ($invocant, @arguments) = @_;
    return $invocant->glMultMatrixx_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->glMultMatrixx_j1(@arguments) if scalar(@arguments) == 1;
    die "No method glMultMatrixx takes " . scalar(@arguments) . " arguments";
}


sub glMultiTexCoord4f {
    my ($self, $target, $s, $t, $r, $q) = @_;
        return;
}


sub glMultiTexCoord4x {
    my ($self, $target, $s, $t, $r, $q) = @_;
}


sub glNormal3f {
    my ($self, $nx, $ny, $nz) = @_;
        return;
}


sub glNormal3x {
    my ($self, $nx, $ny, $nz) = @_;
}


sub glNormalPointer {
    my ($self, $type, $stride, $pointer) = @_;
        return;
}


sub glOrthof {
    my ($self, $left, $right, $bottom, $top, $zNear, $zFar) = @_;
        return;
}


sub glOrthox {
    my ($self, $left, $right, $bottom, $top, $zNear, $zFar) = @_;
}


sub glPixelStorei {
    my ($self, $pname, $param) = @_;
        return;
}


sub glPointSize {
    my ($self, $size) = @_;
        return;
}


sub glPointSizex {
    my ($self, $size) = @_;
}


sub glPolygonOffset {
    my ($self, $factor, $units) = @_;
        return;
}


sub glPolygonOffsetx {
    my ($self, $factor, $units) = @_;
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


sub glSampleCoveragex {
    my ($self, $value, $invert) = @_;
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


sub glTexEnvfv_j4 {
    my ($self, $target, $pname, $params, $offset) = @_;
        return;
}


sub glTexEnvfv_j3 {
    my ($self, $target, $pname, $params) = @_;
        return;
}

sub glTexEnvfv {
    my ($invocant, @arguments) = @_;
    return $invocant->glTexEnvfv_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->glTexEnvfv_j3(@arguments) if scalar(@arguments) == 3;
    die "No method glTexEnvfv takes " . scalar(@arguments) . " arguments";
}


sub glTexEnvx {
    my ($self, $target, $pname, $param) = @_;
}


sub glTexEnvxv_j4 {
    my ($self, $target, $pname, $params, $offset) = @_;
}


sub glTexEnvxv_j3 {
    my ($self, $target, $pname, $params) = @_;
}

sub glTexEnvxv {
    my ($invocant, @arguments) = @_;
    return $invocant->glTexEnvxv_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->glTexEnvxv_j3(@arguments) if scalar(@arguments) == 3;
    die "No method glTexEnvxv takes " . scalar(@arguments) . " arguments";
}


sub glTexImage2D {
    my ($self, $target, $level, $internalformat, $width, $height, $border, $format, $type, $pixels) = @_;
        return;
}


sub glTexParameterf {
    my ($self, $target, $pname, $param) = @_;
        return;
}


sub glTexParameterx {
    my ($self, $target, $pname, $param) = @_;
}


sub glTexSubImage2D {
    my ($self, $target, $level, $xoffset, $yoffset, $width, $height, $format, $type, $pixels) = @_;
        return;
}


sub glTranslatef {
    my ($self, $x, $y, $z) = @_;
        return;
}


sub glTranslatex {
    my ($self, $x, $y, $z) = @_;
}


sub glVertexPointer {
    my ($self, $size, $type, $stride, $pointer) = @_;
        return;
}


sub glViewport {
    my ($self, $x, $y, $width, $height) = @_;
        return;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::khronos::opengles::GL10 ();
# use java::nio::Buffer ();
# use java::nio::FloatBuffer ();
# use java::nio::IntBuffer ();
use org::allbinary::logic::string::StringUtil ();

1;

