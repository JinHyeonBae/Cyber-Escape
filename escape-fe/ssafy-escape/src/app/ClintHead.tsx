"use client"

import Head from "next/head"
import IMAGE_URL from "@/constants/host"

const ClientHead = () => {
  return (
    <Head>
      <link
        rel="icon"
        href={IMAGE_URL.RESOURCE + "/favicon.ico"}
      />
    </Head>
  )
}

export default ClientHead
