/*
  Warnings:

  - You are about to drop the `Assinaturas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Aulas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Avaliacoes` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Categorias` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Certificados` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Cursos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Matriculas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Modulos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Pagamentos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Planos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Progresso_Aulas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Trilhas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Trilhas_Cursos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Usuarios` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "Profile" AS ENUM ('ADMIN', 'USER');

-- DropForeignKey
ALTER TABLE "Assinaturas" DROP CONSTRAINT "Assinaturas_ID_Plano_fkey";

-- DropForeignKey
ALTER TABLE "Assinaturas" DROP CONSTRAINT "Assinaturas_ID_Usuario_fkey";

-- DropForeignKey
ALTER TABLE "Aulas" DROP CONSTRAINT "Aulas_ID_Modulo_fkey";

-- DropForeignKey
ALTER TABLE "Avaliacoes" DROP CONSTRAINT "Avaliacoes_ID_Curso_fkey";

-- DropForeignKey
ALTER TABLE "Avaliacoes" DROP CONSTRAINT "Avaliacoes_ID_Usuario_fkey";

-- DropForeignKey
ALTER TABLE "Certificados" DROP CONSTRAINT "Certificados_ID_Curso_fkey";

-- DropForeignKey
ALTER TABLE "Certificados" DROP CONSTRAINT "Certificados_ID_Trilha_fkey";

-- DropForeignKey
ALTER TABLE "Certificados" DROP CONSTRAINT "Certificados_ID_Usuario_fkey";

-- DropForeignKey
ALTER TABLE "Cursos" DROP CONSTRAINT "Cursos_ID_Categoria_fkey";

-- DropForeignKey
ALTER TABLE "Cursos" DROP CONSTRAINT "Cursos_ID_Instrutor_fkey";

-- DropForeignKey
ALTER TABLE "Matriculas" DROP CONSTRAINT "Matriculas_ID_Curso_fkey";

-- DropForeignKey
ALTER TABLE "Matriculas" DROP CONSTRAINT "Matriculas_ID_Usuario_fkey";

-- DropForeignKey
ALTER TABLE "Modulos" DROP CONSTRAINT "Modulos_ID_Curso_fkey";

-- DropForeignKey
ALTER TABLE "Pagamentos" DROP CONSTRAINT "Pagamentos_ID_Assinatura_fkey";

-- DropForeignKey
ALTER TABLE "Progresso_Aulas" DROP CONSTRAINT "Progresso_Aulas_ID_Aula_fkey";

-- DropForeignKey
ALTER TABLE "Progresso_Aulas" DROP CONSTRAINT "Progresso_Aulas_ID_Usuario_fkey";

-- DropForeignKey
ALTER TABLE "Trilhas" DROP CONSTRAINT "Trilhas_ID_Categoria_fkey";

-- DropForeignKey
ALTER TABLE "Trilhas_Cursos" DROP CONSTRAINT "Trilhas_Cursos_ID_Curso_fkey";

-- DropForeignKey
ALTER TABLE "Trilhas_Cursos" DROP CONSTRAINT "Trilhas_Cursos_ID_Trilha_fkey";

-- DropTable
DROP TABLE "Assinaturas";

-- DropTable
DROP TABLE "Aulas";

-- DropTable
DROP TABLE "Avaliacoes";

-- DropTable
DROP TABLE "Categorias";

-- DropTable
DROP TABLE "Certificados";

-- DropTable
DROP TABLE "Cursos";

-- DropTable
DROP TABLE "Matriculas";

-- DropTable
DROP TABLE "Modulos";

-- DropTable
DROP TABLE "Pagamentos";

-- DropTable
DROP TABLE "Planos";

-- DropTable
DROP TABLE "Progresso_Aulas";

-- DropTable
DROP TABLE "Trilhas";

-- DropTable
DROP TABLE "Trilhas_Cursos";

-- DropTable
DROP TABLE "Usuarios";

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" TEXT,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "profile" "Profile" NOT NULL DEFAULT 'USER',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
